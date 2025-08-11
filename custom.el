;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f1e8339b04aef8f145dd4782d03499d9d716fdc0361319411ac2efc603249326"
     "871b064b53235facde040f6bdfa28d03d9f4b966d8ce28fb1725313731a2bcc8"
     "f87c86fa3d38be32dc557ba3d4cedaaea7bc3d97ce816c0e518dfe9633250e34"
     "e8bd9bbf6506afca133125b0be48b1f033b1c8647c628652ab7a2fe065c10ef0"
     "3538194fff1b928df280dc08f041518a8d51ac3ff704c5e46d1517f5c4d8a0e0" default))
 '(dape-configs
   '((attach modes nil ensure
      (lambda (config)
        (unless (plist-get config 'port) (user-error "Missing `port' property")))
      host "localhost" :request "attach")
     (launch modes nil ensure
      (lambda (config)
        (unless (plist-get config 'command)
          (user-error "Missing `command' property")))
      command-cwd dape-command-cwd :request "launch")
     (bash-debug modes (sh-mode bash-ts-mode) ensure
      (lambda (config) (dape-ensure-command config)
        (let ((dap-debug-server-path (car (plist-get config 'command-args))))
          (unless (file-exists-p dap-debug-server-path)
            (user-error "File %S does not exist" dap-debug-server-path))))
      fn
      (lambda (config)
        (thread-first
          config
          (plist-put :pathBashdbLib
                     "/home/pineapple/.doom.d/debug-adapters/bash-debug/extension/bashdb_dir")
          (plist-put :pathBashdb
                     (file-name-concat
                      "/home/pineapple/.doom.d/debug-adapters/bash-debug/extension/bashdb_dir"
                      "bashdb"))
          (plist-put :env
                     `(:BASHDB_HOME
                       ,"/home/pineapple/.doom.d/debug-adapters/bash-debug/extension/bashdb_dir"
                       \, (plist-get config :env)))))
      command "node" command-args
      ("/home/pineapple/.doom.d/debug-adapters/bash-debug/extension/out/bashDebug.js")
      :type "bashdb" :cwd dape-cwd :program dape-buffer-default :args []
      :pathBash "bash" :pathCat "cat" :pathMkfifo "mkfifo" :pathPkill "pkill")
     (codelldb-cc modes (c-mode c-ts-mode c++-mode c++-ts-mode) ensure
      dape-ensure-command command
      "/home/pineapple/.doom.d/debug-adapters/codelldb/extension/adapter/codelldb"
      command-cwd dape-command-cwd :type "lldb" :request "launch" command-args
      ("--port" :autoport) port :autoport :cwd "." :program "a.out" :args []
      :stopOnEntry nil)
     (codelldb-rust ensure dape-ensure-command command
      "/home/pineapple/.doom.d/debug-adapters/codelldb/extension/adapter/codelldb"
      command-cwd dape-command-cwd :type "lldb" :request "launch" modes
      (rust-mode rust-ts-mode) command-args
      ("--port" :autoport "--settings" "{\"sourceLanguages\":[\"rust\"]}") port
      :autoport :cwd "." :program
      (file-name-concat "target" "debug"
                        (car
                         (last
                          (file-name-split (directory-file-name (dape-cwd))))))
      :args [] :stopOnEntry nil)
     (cpptools modes (c-mode c-ts-mode c++-mode c++-ts-mode) ensure
      dape-ensure-command fn
      (lambda (config)
        (let ((program (plist-get config :program)))
          (if (file-name-absolute-p program) config
            (thread-last
              (tramp-file-local-name (dape--guess-root config))
              (expand-file-name program) (plist-put config :program)))))
      command
      "/home/pineapple/.doom.d/debug-adapters/cpptools/extension/debugAdapters/bin/OpenDebugAD7"
      command-cwd dape-command-cwd :type "cppdbg" :request "launch" :cwd "."
      :program "a.out" :MIMode "gdb")
     (debugpy modes (python-mode python-ts-mode) ensure
      (lambda (config) (dape-ensure-command config)
        (let ((python (dape-config-get config 'command)))
          (unless
              (zerop
               (process-file-shell-command
                (format "%s -c \"import debugpy.adapter\"" python)))
            (user-error "%s module debugpy is not installed" python))))
      :type "python" :request "launch" command
      (progn (require 'python) python-interpreter) command-args
      ("-m" "debugpy.adapter" "--host" "0.0.0.0" "--port" :autoport) port
      :autoport :cwd dape-cwd :program dape-buffer-default :args [] :justMyCode
      nil :console "integratedTerminal" :showReturnValue t :stopOnEntry nil)
     (debugpy-module modes (python-mode python-ts-mode) ensure
      (lambda (config) (dape-ensure-command config)
        (let ((python (dape-config-get config 'command)))
          (unless
              (zerop
               (process-file-shell-command
                (format "%s -c \"import debugpy.adapter\"" python)))
            (user-error "%s module debugpy is not installed" python))))
      :type "python" :request "launch" command
      (progn (require 'python) python-interpreter) command-args
      ("-m" "debugpy.adapter" "--host" "0.0.0.0" "--port" :autoport) port
      :autoport :cwd dape-cwd :module
      (car (last (file-name-split (directory-file-name default-directory))))
      :args [] :justMyCode nil :console "integratedTerminal" :showReturnValue t
      :stopOnEntry nil)
     (dlv ensure dape-ensure-command command "dlv" command-args
      ("dap" "--listen" "127.0.0.1::autoport") command-insert-stderr t
      command-cwd dape-command-cwd :type "go" :request "launch" modes
      (go-mode go-ts-mode) port :autoport :cwd "." :program ".")
     (flutter ensure dape-ensure-command command "flutter" command-args
      ("debug_adapter") command-cwd dape-command-cwd :type "dart" modes
      (dart-mode) :cwd "." :program "lib/main.dart" :toolArgs ["-d" "all"])
     (gdb modes (c-mode c-ts-mode c++-mode c++-ts-mode) ensure
      (lambda (config) (dape-ensure-command config)
        (let*
            ((default-directory
              (or (dape-config-get config 'command-cwd) default-directory))
             (command (dape-config-get config 'command))
             (output (shell-command-to-string (format "%s --version" command)))
             (version
              (save-match-data
                (when
                    (string-match "GNU gdb \\(?:(.*) \\)?\\([0-9.]+\\)" output)
                  (string-to-number (match-string 1 output))))))
          (unless (>= version 14.1) (user-error "Requires gdb version >= 14.1"))))
      command "gdb" command-args ("--interpreter=dap") command-cwd
      dape-command-cwd :request "launch" :program "a.out" :args []
      :stopAtBeginningOfMainSubprogram nil)
     (godot port 6006 :type "server" :request "launch" modes (gdscript-mode))
     (js-debug-node modes (js-mode js-ts-mode) ensure
      #[257
        "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
        [dape-ensure-command dape-config-get :runtimeExecutable
                             dape--ensure-executable plist-get command-args
                             file-exists-p user-error "File %S does not exist"]
        5 "\12\12(fn CONFIG)"]
      command "node" :type "pwa-node" command-args
      ("/home/pineapple/.emacs.d/debug-adapters/js-debug/src/dapDebugServer.js"
       :autoport)
      port :autoport :cwd dape-cwd :program dape-buffer-default :console
      "externalTerminal")
     (js-debug-ts-node modes (typescript-mode typescript-ts-mode) ensure
      #[257
        "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
        [dape-ensure-command dape-config-get :runtimeExecutable
                             dape--ensure-executable plist-get command-args
                             file-exists-p user-error "File %S does not exist"]
        5 "\12\12(fn CONFIG)"]
      command "node" :type "pwa-node" command-args
      ("/home/pineapple/.emacs.d/debug-adapters/js-debug/src/dapDebugServer.js"
       :autoport)
      port :autoport :runtimeExecutable "tsx" :cwd dape-cwd :program
      dape-buffer-default :console "externalTerminal")
     (js-debug-node-attach modes
      (js-mode js-ts-mode typescript-mode typescript-ts-mode) ensure
      #[257
        "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
        [dape-ensure-command dape-config-get :runtimeExecutable
                             dape--ensure-executable plist-get command-args
                             file-exists-p user-error "File %S does not exist"]
        5 "\12\12(fn CONFIG)"]
      command "node" :type "pwa-node" :request "attach" command-args
      ("/home/pineapple/.doom.d/debug-adapters/js-debug/src/dapDebugServer.js"
       :autoport)
      port :autoport :port 9229)
     (js-debug-chrome modes
      (js-mode js-ts-mode typescript-mode typescript-ts-mode) ensure
      #[257
        "\300\1!\210\301\1\302\"\211\203\20\0\303\1!\210\210\304\1\305\"@\306\1!?\205!\0\307\310\2\"\207"
        [dape-ensure-command dape-config-get :runtimeExecutable
                             dape--ensure-executable plist-get command-args
                             file-exists-p user-error "File %S does not exist"]
        5 "\12\12(fn CONFIG)"]
      command "node" :type "pwa-chrome" command-args
      ("/home/pineapple/.doom.d/debug-adapters/js-debug/src/dapDebugServer.js"
       :autoport)
      port :autoport :url "http://localhost:3000" :webRoot dape-cwd)
     (lldb-vscode ensure dape-ensure-command command "lldb-vscode" command-cwd
      dape-command-cwd :type "lldb-vscode" modes
      (c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode rustic-mode)
      :cwd "." :program "a.out")
     (lldb-dap ensure dape-ensure-command command "lldb-dap" command-cwd
      dape-command-cwd :type "lldb-dap" modes
      (c-mode c-ts-mode c++-mode c++-ts-mode rust-mode rust-ts-mode rustic-mode)
      :cwd "." :program "a.out")
     (netcoredbg modes (csharp-mode csharp-ts-mode) ensure dape-ensure-command
      command "netcoredbg" :request "launch" command-args
      ["--interpreter=vscode"] :cwd dape-cwd :program
      (if-let*
          ((dlls
            (file-expand-wildcards (file-name-concat "bin" "Debug" "*" "*.dll"))))
          (file-relative-name (file-relative-name (car dlls)))
        ".dll")
      :stopAtEntry nil)
     (ocamlearlybird ensure dape-ensure-command command "ocamlearlybird"
      command-args ("debug") :type "ocaml" modes (tuareg-mode caml-mode)
      :program
      (file-name-concat (dape-cwd) "_build" "default" "bin"
                        (concat (file-name-base (dape-buffer-default)) ".bc"))
      :console "internalConsole" :stopOnEntry nil :arguments [])
     (rdbg modes (ruby-mode ruby-ts-mode) ensure dape-ensure-command fn
      (lambda (config)
        (plist-put config 'command-args
                   (mapcar
                    (lambda (arg) (if (eq arg :-c) (plist-get config '-c) arg))
                    (plist-get config 'command-args))))
      command "rdbg" command-cwd dape-command-cwd :type "Ruby" command-args
      ("-O" "--host" "0.0.0.0" "--port" :autoport "-c" "--" :-c) port :autoport
      -c (concat "ruby " (dape-buffer-default)))
     (jdtls modes (java-mode java-ts-mode) ensure
      (lambda (config)
        (let ((file (dape-config-get config :filePath)))
          (unless (and (stringp file) (file-exists-p file))
            (user-error "Unable to locate :filePath `%s'" file))
          (with-current-buffer (find-file-noselect file)
            (unless (and (featurep 'eglot) (eglot-current-server))
              (user-error "No eglot instance active in buffer %s"
                          (current-buffer)))
            (unless
                (seq-contains-p
                 (eglot--server-capable :executeCommandProvider :commands)
                 "vscode.java.resolveClasspath")
              (user-error
               "Jdtls instance does not bundle java-debug-server, please install")))))
      fn
      (lambda (config)
        (with-current-buffer
            (find-file-noselect (dape-config-get config :filePath))
          (if-let* ((server (eglot-current-server)))
              (pcase-let
                  ((`[,module-paths ,class-paths]
                    (eglot-execute-command server "vscode.java.resolveClasspath"
                                           (vector (plist-get config :mainClass)
                                                   (plist-get config
                                                              :projectName))))
                   (port
                    (eglot-execute-command server
                                           "vscode.java.startDebugSession" nil)))
                (thread-first
                  config (plist-put 'port port)
                  (plist-put :modulePaths module-paths)
                  (plist-put :classPaths class-paths)))
            server)))
      :type "java" :request "launch" :filePath
      #[0 "\300\301!\206\14\0\302\303 \304 \"\207"
          [#[257
             "\3001!\0\301\302 \303\304\305\306 !!#\307\310\2\"\206\31\0\211\311H\312\1\4\"\266\2020\207\313\207"
             [(error) eglot-execute-command eglot-current-server
              "vscode.java.resolveMainClass" file-name-nondirectory
              directory-file-name dape-cwd seq-find
              #[257 "\300\1\301\"\302 \232\207"
                    [plist-get :filePath buffer-file-name] 4 "\12\12(fn VAL)"]
              0 plist-get nil]
             8 "\12\12(fn KEY)"]
           :filePath expand-file-name dape-buffer-default dape-cwd]
          3]
      :mainClass
      #[0 "\300\301!\207"
          [#[257
             "\3001!\0\301\302 \303\304\305\306 !!#\307\310\2\"\206\31\0\211\311H\312\1\4\"\266\2020\207\313\207"
             [(error) eglot-execute-command eglot-current-server
              "vscode.java.resolveMainClass" file-name-nondirectory
              directory-file-name dape-cwd seq-find
              #[257 "\300\1\301\"\302 \232\207"
                    [plist-get :filePath buffer-file-name] 4 "\12\12(fn VAL)"]
              0 plist-get nil]
             8 "\12\12(fn KEY)"]
           :mainClass]
          2]
      :projectName
      #[0 "\300\301!\207"
          [#[257
             "\3001!\0\301\302 \303\304\305\306 !!#\307\310\2\"\206\31\0\211\311H\312\1\4\"\266\2020\207\313\207"
             [(error) eglot-execute-command eglot-current-server
              "vscode.java.resolveMainClass" file-name-nondirectory
              directory-file-name dape-cwd seq-find
              #[257 "\300\1\301\"\302 \232\207"
                    [plist-get :filePath buffer-file-name] 4 "\12\12(fn VAL)"]
              0 plist-get nil]
             8 "\12\12(fn KEY)"]
           :projectName]
          2]
      :args "" :stopOnEntry nil :vmArgs
      " -XX:+ShowCodeDetailsInExceptionMessages" :console "integratedConsole"
      :internalConsoleOptions "neverOpen")
     (xdebug ensure
      (lambda (config) (dape-ensure-command config)
        (let ((dap-debug-server-path (car (plist-get config 'command-args))))
          (unless (file-exists-p dap-debug-server-path)
            (user-error "File %S does not exist" dap-debug-server-path))))
      command "node" command-args
      ("/home/pineapple/.doom.d/debug-adapters/php-debug/extension/out/phpDebug.js")
      :type "php" modes (php-mode php-ts-mode) :port 9003)))
 '(scroll-conservatively 101))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
