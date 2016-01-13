ニューラルネットワークによる文字認識
	Naruaki TOMA
	tnal@ie.u-ryukyu.ac.jp
	http://www.eva.ie.u-ryukyu.ac.jp/~tnal/
	Fri Sep  9 12:11:39 JST 2005


＜目次＞
0. これは何？
1. 何のために作ったの？
2. 開発環境
3. ファイル
4. コンパイル方法
  4.1 数字文字認識の場合
  4.2 平仮名文字認識の場合
  4.3 アルファベット文字認識の場合
  4.4 漢字文字認識の場合
5. 使い方
6. その他の細かな点
  6.1 パラメータを変更したい。
  6.2 実験する際に毎回 l とか入力するのは面倒。
7. 最後に
X. 考えてはいたけどやらなかったTODO


＜本文＞
0. これは何？
　タイトルのままですが，ニューラルネットワークを用いた文字認識用の
プログラムです．代表的なモデルである入力・中間・出力の3階層で構成
される階層型ニューラルネットを用い，学習には逐次が他バックプロパ
ゲーションを用いています．これで通じない人は
	ニューラルネット, 階層型, バックプロパゲーション
	(artificial) neural network, hierarchical, back propagation
あたりのキーワードで検索エンジンを利用すると良いでしょう．ついで
に，src java class 等のキーワードを付加すると，公開されているソー
スを簡単に探し出すことが出来ます．シンプルな階層型で十分であるなら
	http://www.eva.ie.u-ryukyu.ac.jp/~tnal/Job/NN/basic/
にある一連のソースも役に立つかもしれません．


1. 何のために作ったの？
　学生実験用に，インタラクティブに
　　　・指定した試行回数分重みを学習し
　　　・学習事例を用いた学習度合いを確認，または
　　　・未知事例を用いた柔軟さの確認
といった事を出来るように作りました．シェルスクリプトで学習ステップ
数毎の誤差推移図を作成するようにしてたりしますが，情報工学科の学生
実験という意味では復習のために書いてみたぐらいの意味合いです．


2. 開発環境
  OS: Mac OS X バージョン 10.4.2
  gcc: gcc version 4.0.0 20041026 (Apple Computer, Inc. build 4061)
  make: GNU Make 3.80
  gnuplot: gnuplot 3.8k patchlevel 3+0.10
  bash: GNU bash, version 2.05b.0(1)-release (powerpc-apple-darwin8.0)

動作確認は Mac OS X でしかやっていませんが，ANSI標準ライブラリしか
使ってないので，環境に依存せずコンパイルできると思います．多分．
bash や gnuplot はシェルスクリプトを使わないのであれば必要ありません．


3. ファイル
./0README_ja.txt	このファイル．
./sample-output
./sample-output/result.data	図作成用データ（ステップ毎のエラー）．
./sample-output/result.learned	学習事例に対する学習度合いのチェック結果．
./sample-output/result.png	ステップ毎のエラー推移図．
./sample-output/result.txt	run_nn.bash 利用時の出力例．
./src
./src/.gnuplot		作図用スクリプト(run_bash.bashで自動生成)．
./src/data		データ保存用ディレクトリ．
./src/data/eva1-1.txt	　　learn?.txt を学習用事例として用います．
./src/data/eva1-2.txt	　　eva* はファイル名は何でも良いのですが，
./src/data/learn0.txt　　　　　未知事例として作ったものです．
./src/data/learn1.txt	　　事例データは正答＋入力パターンで構成され，
./src/data/learn2.txt	　　　　正答は半角英数字1文字
./src/data/learn3.txt	　　　　入力パターンは parameter.h で指定した
./src/data/learn4.txt	　　　　サイズで指定する必要があります．
./src/data/learn5.txt
./src/data/learn6.txt
./src/data/learn7.txt
./src/data/learn8.txt
./src/data/learn9.txt
./src/data.ja/		データ保存用ディレクトリ(平仮名用)．
./src/data.en/		データ保存用ディレクトリ(アルファベット用)．
./src/ex_bp_o.c		3階層型NN＋BPのサンプル．このプログラムでは未使用．
./src/input.txt		標準入力サンプル(数字用)。
./src/input.ja.txt	標準入力サンプル(平仮名用)。
./src/input.en.txt	標準入力サンプル(アルファベット用)。
./src/Makefile
./src/num.c		メインプログラム．
./src/parameter.h	各種パラメータ等．
./src/problem_list.txt	学習用事例リスト．
./src/problem_list.ja.txt	学習用事例リスト(平仮名用)．
./src/problem_list.en.txt	学習用事例リスト(アルファベット用)．
./src/run_nn.bash	作図用スクリプト．
./src/set_problem.c	主に事例読み込み部．
./src/sigmoid.c		シグモイド関数．


4. コンパイル方法
4.1 数字文字認識の場合
数字文字認識用のデータが data/ に置いてあります。
これを用いて実験する場合は、
特に変更する事無しに、src ディレクトリにて make コマンドを実行。
　　prompt> make

4.2 平仮名文字認識の場合
平仮名文字認識用のデータが data.ja/ に置いてあります。
これを用いて実験する場合は、
(1) parameter.h 内の "problem_list.txt" を "problem_list.ja.txt" に変更。
(2) make コマンドを実行。

4.3 アルファベット文字認識の場合
アルファベット文字認識用のデータが data.en/ に置いてあります。
これを用いて実験する場合は、
(1) parameter.h 内の "problem_list.txt" を "problem_list.en.txt" に変更。
(2) make コマンドを実行。

4.4 漢字文字認識の場合
アルファベット文字認識用のデータが data.kanji/ に置いてあります。
これを用いて実験する場合は、
(1) parameter.h 内の
 - "problem_list.txt" を "problem_list.en.txt" に変更。
 - SIZE_X を 17 に変更。
 - SIZE_Y を 19 に変更。
(2) make コマンドを実行。



5. 使い方
実行ファイル(nn_num)、もしくはシェルスクリプト(run_nn.bash)に
引数としてシード値を与えて実行してください。

　　prompt> ./nn_num 1
とすると，学習用事例を読み込み，usage を出力しますので，それに
従ってインタラクティブに動かしてみいて下さい．シェルスクリプト
を利用する場合は
　　prompt> ./run_nn.bash 1
です．（その後は同じ）

  ===== USAGE =====
  learn: nn> l
  check: nn> c
  evaluation: nn> e
       after that, input filename defined test-pattern
  =================

指定した試行回数分，学習させるには「l」．
学習事例に対する学習度合いを確認するには「c」．
未知事例に対する適応度合いを確認するには「e」を入力後，
ファイル名を促すプロンプトが出力されますので，未知事例を
保存したファイル名を入力してください．


6. その他の細かな点
6.1 パラメータを変更したい。
　parameter.h を参照ください。

6.2 実験する際に毎回 l とか入力するのは面倒。
　「l」に限定した話なら parameter.h 内の「ITERATIONS」
の値を増やすことで、一度に学習する回数の上限を変更する
ことができます。
　それ以外の c や e 等もまとめての話なら、標準入力を
ファイルに切り替えることで自動化することが可能です。
例えば、
	nn> l
	nn> l
	nn> c
	nn> e
	filename? --> data/eva1-1.txt
	nn> q
のように l,l,c,e,data/eva1-1.txt, q の6項目をこの順序で
毎回入力するのでそれを自動化したいという場合には、
その6項目＋空の行を記入したファイル input.txt を作成して
ください。
=====begin(input.txt)=====
l
l
c
e
data/eva1-1.txt
q

=====end(input.txt)=====
上記のように作成したファイルを使って、標準入力代わりに
使うと、自動で入力した結果を得ることができます。具体的には、
	./nn_num 1 < input.txt
	もしくは
	./run_nn.bash 1 < input.txt
のように実行すると、手で入力する手間を省くことができます。


7. 最後に
質問・ご指摘等は當間（tnal@ie.u-ryukyu.ac.jp）まで．
更新するかどうかは（私に取っての）重要度と気分次第ですが・・・．
個人的利用以外の使用については連絡してもらえるとうれしいかも．
単純にどういう所で使われるのかが興味があるだけで，制約・制限
等を課す意図は全くありません．


X. 考えてはいたけどやらなかったTODO
・Java か cocoa で NN の視覚化．
　GUIなプログラミングは嫌いなんです・・
・重みの save/restore．
　今回は必要なかったので．
・事例データ作成ツール．
　面倒ですが，サンプルなので手動で頑張る方向で．

