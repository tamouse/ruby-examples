 def create
   @errors = if params[:metrics].empty?
               Rails.logger.debug("ANANTH1:: errors obj:: #{@errors.inspect}")
               [ "No metrics were provided" ]
             else
               metrics_validator = Rearview::MetricsValidator.new({attributes: [:metrics]})
               params[:metrics].inject([]) { |a,v| a << "Metrics contains an invalid metric: #{v}" unless(metrics_validator.metric_valid?(v)); a }
             end
   debugger
   results = if @errors.empty?
               Rails.logger.debug("ANANTH2:: results obj:: #{@results.inspect}")
               Rails.logger.debug("ANANTH3:: #{:metrics}")
               Rearview::MonitorRunner.run(params[:metrics],params[:monitorExpr],params[:minutes],{},false,params[:toDate],true)
             else
               { }
             end
   @monitor_output = Rearview::MonitorRunner.normalize_results(results)
   Rails.logger.debug("ANANTH4:: monitor_output obj:: #{@monitor_output.inspect}")
 end
