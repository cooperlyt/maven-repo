#!/bin/sh

echo "    3、参数说明：r/s r是release正式版本，s是snapshot快照版本"

#deploy参数，snapshot 表示快照包，简写为s， release表示正式包，简写为r
set arg=%1

set "branch="

if "s"=="%arg%" (
    set "branch=snapshot"
)

if "r"=="%arg%" (
    set "branch=release"
)

#正式包发布 release分支
echo 本地存储库的发送到github仓库%branch%分支上
git add .
git commit -m "commit new"
git pull
git push origin %branch%

echo 将%branch%分支合并到master分支
git checkout master
git add .
git git commit -m 'master'
git merge %branch%
git commit -m 'master merge'
git push origin master

pause
