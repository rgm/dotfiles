{:user {
        ; :injections [(require 'pjstadig.humane-test-output)
        ;              (pjstadig.humane-test-output/activate!)]
        :plugins [[com.jakemccrary/lein-test-refresh "0.24.1"]
                  ; [pjstadig/humane-test-output "0.8.3"]
                  [lein-ancient "0.6.15"]
                  [lein-cljfmt "0.6.4"]
                  [venantius/yagni "0.1.7"]]

        :test-refresh {:notify-command
                       ["terminal-notifier" "-title" "test-refresh" "-message"]
                       ; :quiet true
                       ; :changes-only true
                       }}}
