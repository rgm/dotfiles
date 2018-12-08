{:user {
        ; :injections [(require 'pjstadig.humane-test-output)
        ;              (pjstadig.humane-test-output/activate!)]
        :plugins [[com.jakemccrary/lein-test-refresh "0.16.0"]
                  ; [pjstadig/humane-test-output "0.8.3"]
                  [lein-ancient "0.6.14"]
                  [lein-cljfmt "0.5.7"]
                  [venantius/yagni "0.1.6"]]

        :test-refresh {:notify-command
                       ["terminal-notifier" "-title" "test-refresh" "-message"]
                       ; :quiet true
                       ; :changes-only true
                       }}}
