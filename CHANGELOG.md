# CHANGELOG.md

dotfiles から切り離して、github へ。

## Unreleased
- たぶん、俺の ansible の使い方は違う。
  コピーを自動化するのが目的ではなく、
  期待する状態に持っていくためのコードを書くんだな。
- src のほかに、src.stop を作ったらどうか？
  src は bin へ行く。
  src.stop は bin から戻す。
  開発中は src.dev とか。
- 開発中はサフィックスがあったほうがいいのだが、
  ~/bin 等にインストールするときは.sh, .clj のサフィックスを落とせないか？
  いちいち手で書かなくちゃか？
- which is better, make or ansible?

## 0.4.0-SNAPSHOT
- hello.js requires `#!/usr/bin/env node`
- killj.js

## 0.3.5 - 2022-03-28
- fix typo occured in 0.3.4

## 0.3.4 - 2022-03-16
- ansible-playbook -i localhost, -c local よりも cp?
- make install

## 0.3.3 - 2022-03-14
### Added
- added src/refresh-m2.sh, updated utils.yml for it.

## 0.3.2 - 2022-03-02
### Changed
- hello.js - can take -p port -m 'message' option. 2022-03-01
- src/* にサフィックスを付与（全部じゃない）。

## 0.3.1 - 2022-02-18
### Fixed
- tag 0.3.0 already taken.

## 0.3.0 - 2022-02-16
### Added
- find-versions - list available coordinates
- cljs.sh - ClojureScript browser repl starter
- hello.js - node example web server

## 0.2.1 - 2021-12-12
* the name of subdir `utils` is `src` (was `resources`)

## 0.2.0 - 2021-11-28
### Changed
* rename bump-version-project.sh as bump-version.sh
  improve script (need check on linux)
* bump-version.sh: should not include `-E` in ${SED}
* rename utils/ to resources/
### Added
* addhomebrew-sshd.yml

## 0.1.0 - 2021-09-28
### Changed
* rename and improve `bump-version-project.sh` to `bump-version.sh`
  The POSIX standard does not support back-references.
### Added
* c2html
  C のソースファイルから HTML を生成する。adoc 経由。


## これより古いののドキュメントはぼちぼち。
