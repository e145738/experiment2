#実験方法プラン

##1. プログラムの改変

###level2.1
steepest_decent.cの35行目と47行目を以下のように修正  

```c
z = x * x;  /* 35行目 */

z_dx = 2*x; /* 47行目 */
```

##2. alphaを固定し，seed値を変更して平均step数の少ないseedを探索

alphaをデフォルトの0.1に固定して"run_ave.sh"で測る.

##3. seed値を固定し，alphaを変更して平均step数の少ないalphaを探索

指定した引数にalphaを変更するスクリプト"change_alpha.sh"と
処理を実行して,平均値をalpha_ave.txtにぶちこむ"run_alpha.sh"を作成．  

この二つを用いて以下のように手動で実行  
```
$ sh change_alpha.sh 1
$ make 
$ sh run_alpha.sh 1
change_alpha.shの引数をインクリメントし，これを繰り返す.
```

ほんとはスクリプト一つでできたらよかったんだけど無理だった...  

2と3はどっちを先にやっても可!!  

また，二つを一つにして
run_alphaの代わりにrun_aveを使って,平均stepの少ないalphaを探すってものありかもしれない...

change_alpha.sh  
```shell
#!/bin/sh

if [ $# -eq 1 ] ; then
    alpha=$1
else
	exit 0
fi
	
sed -i -e "68s/alpha = [0-9].[0-9]/alpha = 0.$alpha/g" steepest_decent.c

```
run_alpha.sh  
```shell
#!/bin/sh

if [ $# -eq 1 ] ; then
    alpha=$1
else
	exit 0
fi

exec_file="./steepest_decent"
average_file="./alpha_ave.txt"

	$exec_file 1 > .alpha_$alpha
	tail -1 .alpha_$alpha | cut -f2 -d" " >> $average_file
	echo "sim $sim: alpha=0.$alpha ->" `tail -1 $average_file`

# 平均試行回数を計算
steps=`cat $average_file`
sum=0
for step in $steps
do
    sum=`expr $sum + $step`
done
/bin/echo -n "average step = "
bc<<EOF
scale=2;
$sum/10
EOF
```

##4. グラフ化

最後にseedとalphaに最小stepを出したパラメータを入力して,"trans_x_vs_func.sh"を実行


