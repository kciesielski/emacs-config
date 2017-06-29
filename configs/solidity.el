(require 'package)
(packages-conditional-install '(flycheck solidity-mode))

(require 'solidity-mode)
(when (eq system-type 'darwin)
(setq solidity-solc-path "/usr/local/bin/solc")
)
(add-hook 'solidity-mode-hook 'flycheck-mode)
