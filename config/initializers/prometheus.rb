require "prometheus/middleware/collector"
require "prometheus/middleware/exporter"

registry = Prometheus::Client.registry

PROCESS_CPU_SECONDS_TOTAL = registry.gauge(
  :process_cpu_seconds_total,
  docstring: "Total user and system CPU time spent by this process, in seconds."
)

PROCESS_RESIDENT_MEMORY_BYTES = registry.gauge(
  :process_resident_memory_bytes,
  docstring: "Resident memory size of this process, in bytes."
)

PRODUCTS_CREATED_TOTAL = registry.counter(
  :products_created_total,
  docstring: "Total number of products created."
)

class ProcessMetricsUpdater
  def initialize(app)
    @app = app
  end

  def call(env)
    times = Process.times
    PROCESS_CPU_SECONDS_TOTAL.set(times.utime + times.stime)

    rss_kb = `ps -o rss= -p #{Process.pid}`.to_i
    PROCESS_RESIDENT_MEMORY_BYTES.set(rss_kb * 1024)

    @app.call(env)
  end
end

class MetricsBasicAuth
  USERNAME = "prometheus"
  PASSWORD = "admin"

  def initialize(app)
    @app = app
  end

  def call(env)
    return @app.call(env) unless env["PATH_INFO"] == "/metrics"

    request = Rack::Auth::Basic::Request.new(env)

    if request.provided? && request.basic? && request.credentials == [USERNAME, PASSWORD]
      @app.call(env)
    else
      [401, { "Content-Type" => "text/plain", "WWW-Authenticate" => 'Basic realm="Metrics"' }, ["Unauthorized"]]
    end
  end
end

Rails.application.middleware.use Prometheus::Middleware::Collector
Rails.application.middleware.use ProcessMetricsUpdater
Rails.application.middleware.use MetricsBasicAuth
Rails.application.middleware.use Prometheus::Middleware::Exporter
