


+ インフラ、 matrixの人
qiita.com/sion_cojp/items/

+ SE
www.casleyconsulting.co.jp/blog/engineer/frontend/

+ python
qiita.com/shunyooo/items/69c3523a8c500b37f33f

+ シェルスクリプトはそう書いちゃ駄目
qiita.com/piroor/items/77233173707a0baa6360

+ bash cheat-sheet
kohkimakimoto.hatenablog.com/entry/2016/03/14/044924


___


___
+ lesson
tutorialspoint.com/tutorialslibrary.htm

+ 3年ぶりのコーディングで参考にしたサイト
aoicotori.hatenablog.com/entry/coding2019
___
+ react
github.com/teradonburi/learnReactJS

+ 誰もがやりたかった10の機能。
qiita.com/y_kawase/items/8f1b5a303400a09c4923

+ nuxtJS
www.ritolab.com/entry/192
___
PHP
+ SPA
qiita.com/SoraKumo/items/ded7cec28b3b8792bb88

+ larabel
www.ritolab.com/entry/40

+ wp
websae.net/category/wordpress/
___
+ mdc
github.com/material-components/material-components-web/tree/master/packages

+ マテリアルデザインでやってはいけない68のこと
saruwakakun.com/html-css/material/failure#section4
___
css
+ grid
gridbyexample.com/

+ form
https://www.nxworld.net/tips/15-useful-css-snippets-in-form-style.html

___

+ EC
suprema.select-themes.com/

+ simple, gradient
laurenwickware.com

+ toyo

+ mdc風
glitter-style.jp/labo/web-resource/master-the-pjax/
___
blog
+ adobe
blogs.adobe.com/japan/

+ wireframe
blogs.adobe.com/japan/web-start-illustrator-web-design-03-wireframe/

+ ios
https://note.mu/mhtcode_design/n/na5a17c4f423b

+ temp
sokutaku.jp/column/2016/02/wireframe-2.php

+ cssできる人とできない人
blog.mitsuruog.info/2018/03/how-to-learn-css-1

+ トーンカーブ
liginc.co.jp/designer/archives/10121

+ noto-sans, PageSpeed Insights
note.mu/satopen/n/n3006043cb383

+ wp最適化
yokonoji.work/page-speed-guide





##### public
+ [public]
  - test/
  - test/task/
  - test/etc/

+ [private]
  - test/task/script.sh
  - test/etc/private/

+ [option]
  - (test/.gitignore)
  - (test/task/log/diary.md)
  - (test/task/memo.md)
  - (test/project/)


##### link
+ echo msg >> test/task/memo.md
+ echo msg >> test/task/log/diary.md


##### deploy rule
1. deploy: test/public.zip
2. push: cd task/; bash growGrass.sh;
3. reset: reset --hard commitId
4. reflection: cd task/; bash ignored_(...).sh;

___
###### option
未定義の変数を使用するとそこでスクリプトを終了する (set -u)
set -u
基本的に次のset -eも含めてset -euとしておくのがよさそう。

コマンドがエラーだった場合そこでスクリプトを終了する (set -e)
set -e
しておくと、エラー(戻り値0以外を戻すコマンド実行)があると即時終了する

set -eの状態でエラー後も処理を続ける (&&:)
安全のため基本的にset -eをしておいていいが、これはスクリプト内のすべてのコマンド実行の戻り値に対して効果をもつので、困ることも多い。 たとえばコマンド実行の結果をみてメッセージを出したい場合、以下のように書いたりする。

set -e

/path/to/yourcommand
if [ $? -eq 0 ]; then
    echo "yourcommand OK"
else
    echo "yourcommand NG"
fi
しかし/path/to/yourcommandがエラーの時は即時終了してしまうので[ $? -eq 0 ];は評価されず、結果yourcommand NGは絶対に表示されない。 このような場合はコマンドに&&:を続けておくとうまく動作する。(動作原理は下記参考のリンク先参照)

set -e

/path/to/yourcommand &&:
if [ $? -eq 0 ]; then
    echo "yourcommand OK"
else
    echo "yourcommand NG"
fi

パイプで繋いだコマンドがエラーのとき終了させる
パイプでつなぐとset -eをしててもエラー時に終了しないので以下のようにかく。

foo | indent; status=${PIPESTATUS[0]}; [[ ! $status -eq 0 ]] && exit $status





