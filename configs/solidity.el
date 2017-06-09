(require 'package)
(use-package flycheck
  :ensure t)
(use-package solidity-mode
  :ensure t)

(require 'solidity-mode)
(add-hook 'solidity-mode-hook 'flycheck-mode)
