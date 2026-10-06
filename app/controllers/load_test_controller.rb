class LoadTestController < ApplicationController
  FAILURE_RATE = 0.5

  # Burns CPU for a bit so process_cpu_seconds_total / process_resident_memory_bytes
  # visibly move under load. Development-only, see config/routes.rb.
  def spike
    iterations = (params[:iterations].presence || 15_000_000).to_i
    result = 0
    iterations.times { |i| result += i % 7 }
    render json: { status: "ok", result: result }
  end

  # Fails ~50% of the time to generate a realistic 5xx error rate.
  #
  # Renders the error directly instead of raising: Prometheus::Middleware::Collector
  # only records a response's status code into http_server_requests_total when the
  # request completes normally. A raised exception is tracked separately, under
  # http_server_exceptions_total, and never shows up as a 5xx in the request/error-rate
  # metrics the dashboards graph.
  def flaky
    if rand < FAILURE_RATE
      render json: { status: "error", message: "Simulated failure for load testing" }, status: :internal_server_error
    else
      render json: { status: "ok" }
    end
  end
end
