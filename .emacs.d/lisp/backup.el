(provide 'backup)

(setq
backup-by-copying t ; 自动备份
backup-directory-alist
'(("." . "~/.saves")) ; 自动备份在目录"~/.saves"下
delete-old-versions t ; 自动删除旧的备份文件
kept-new-versions 6 ; 保留最近的6个备份文件
kept-old-versions 2 ; 保留最早的2个备份文件
version-control t) ; 多次备份
