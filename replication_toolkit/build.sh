
for i in java python php c cpp csharp ; do
  ./fetch-repos.sh repos_$i
  ./update-repos.sh repos_$i
done

cleanup()
{
  sed -e '/[]|\/=#<>^()!%~?$&;:+@*.,{}"'\''[\-]/d
    /^[0-9]*$/d
    /^[[:alnum:]]\{1\}$/d
    /^0x[A-Fa-f0-9]\{1,6\}$/d'
}

cleanup-php()
{
  sed -e '/[]|\/=#<>^()!%~?&;:+@*.,{}"'\''[\-]/d
    /^[0-9]*$/d
    /^[[:alnum:]]\{1\}$/d
    /^0x[A-Fa-f0-9]\{1,6\}$/d'
}


./tokenize-lang.sh repos_java java Java swords_java.txt |
cleanup >Java-tok

 ./tokenize-lang.sh repos_python py Python swords_python.txt |
cleanup >Python-tok

 ./tokenize-lang.sh repos_php php PHP swords_php.txt |
cleanup-php >PHP-tok

 ./tokenize-lang.sh repos_c c C swords_c.txt |
cleanup >C-tok

 ./tokenize-lang.sh repos_cpp cpp C++ swords_cpp.txt |
cleanup >Cpp-tok

 ./tokenize-lang.sh repos_csharp cs 'C#' swords_csharp.txt |
cleanup >Csharp-tok



../fastText/fasttext skipgram -dim 100 -ws 5 -epoch 20 -input Java-tok -output java-ftskip-dim100-ws5
../fastText/fasttext skipgram -dim 100 -ws 5 -epoch 20 -input Cpp-tok -output cpp-ftskip-dim100-ws5
../fastText/fasttext skipgram -dim 100 -ws 5 -epoch 20 -input PHP-tok -output php-ftskip-dim100-ws5
../fastText/fasttext skipgram -dim 100 -ws 4 -epoch 20 -input Python-tok -output python-ftskip-dim100-ws4
../fastText/fasttext skipgram -dim 100 -ws 5 -epoch 20 -input Csharp-tok -output csharp-ftskip-dim100-ws5
../fastText/fasttext skipgram -dim 100 -ws 5 -epoch 20 -input C-tok -output c-ftskip-dim100-ws5
