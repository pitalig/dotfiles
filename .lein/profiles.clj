{:user {:plugins [[lein-ancient "0.6.15"]]}

 :repl {:dependencies [[clj-dev-env "0.1.0"]]
        :injections [(require 'h)]}

 :rebl {:resource-paths ["/home/gabriel/dev/REBL-0.9.220/REBL-0.9.220.jar"]
        :dependencies [[org.clojure/core.async "0.4.490"]
                       [cljfmt "0.6.4"]]}

 :nrebl {:repl-options {:nrepl-middleware [nrebl.middleware/wrap-nrebl]}
         :dependencies [[rickmoynihan/nrebl.middleware "0.3.1"]]}}