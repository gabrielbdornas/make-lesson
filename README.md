Automation and Make
===

- Material de estudo de automação e Make retirado de tutoriais [Carpentry](http://swcarpentry.github.io/make-novice/)
- [Make documentation](https://www.gnu.org/software/make/)

- Instalação e utilização do estudo
```
# Clonando repositório
$ git clone git@github.com:gabrielbdornas/make-lesson.git

# Instalando variável de ambiente (utilize outra versão python caso necessário)
$ python3.9 -m venv venv

# Criação arquivo .gitignore e excluindo a pasta venv do controle git
$ touch .gitignore && echo "venv" >> .gitignore

# Ativando ambiente
$ source venv/bin/activate

# Instalando dependências necessárias (erros relatados abaixo)
(venv) ➜  make-lesson git:(main) ✗ pip install numpy
(venv) ➜  make-lesson git:(main) ✗ pip install matplotlib
```

- Observações durante o estudo
  - Modifiquei a estrutura inicial do projeto para deixar a pasta mais organizada. Diferença dos comandos em relação ao sugerido nos exercícios:
```
# Sugerido no estudo
$ python countwords.py books/isles.txt isles.dat

# Após a minha modificação
$ python scripts/countwords.py books/isles.txt isles.dat
```
- [Comando head, não conhecia](/20210528-comando-head.md)
- Erro ao executar o comando:
```
$ python plotcounts.py isles.dat ascii

# Erro

(venv) ➜  make-lesson git:(main) ✗ python scripts/plotcounts.py isles.dat ascii
Traceback (most recent call last):
  File "/home/gabrielbdornas/code/gabrielbdornas/make-lesson/scripts/plotcounts.py", line 3, in <module>
    import numpy as np
ModuleNotFoundError: No module named 'numpy'
(venv) ➜  make-lesson git:(main) ✗ pip install numpy
Collecting numpy
  Downloading numpy-1.20.3-cp39-cp39-manylinux_2_12_x86_64.manylinux2010_x86_64.whl (15.4 MB)
     |████████████████████████████████| 15.4 MB 6.2 MB/s
Installing collected packages: numpy
Successfully installed numpy-1.20.3
(venv) ➜  make-lesson git:(main) ✗ python scripts/plotcounts.py isles.dat ascii
Traceback (most recent call last):
  File "/home/gabrielbdornas/code/gabrielbdornas/make-lesson/scripts/plotcounts.py", line 4, in <module>
    import matplotlib.pyplot as plt
ModuleNotFoundError: No module named 'matplotlib'
(venv) ➜  make-lesson git:(main) ✗ pip install matplotlib
```
  - Erro esperado, pois conforme documentação [setup](http://swcarpentry.github.io/make-novice/setup.html) as bibliotecas Numpy and Matplotlib eram necessárias. Resolução:
```
(venv) ➜  make-lesson git:(main) ✗ pip install numpy
(venv) ➜  make-lesson git:(main) ✗ pip install matplotlib
```

  - Erro ao executar comando para gerar gráfico do resultado
```
(venv) ➜  make-lesson git:(main) ✗ python scrips/plotcounts.py isles.dat show
python: can't open file '/home/gabrielbdornas/code/gabrielbdornas/make-lesson/scrips/plotcounts.py': [Errno 2] No such file or directory
(venv) ➜  make-lesson git:(main) ✗ python scripts/plotcounts.py isles.dat show
/home/gabrielbdornas/code/gabrielbdornas/make-lesson/scripts/plotcounts.py:107: UserWarning: Matplotlib is currently using agg, which is a non-GUI backend, so cannot show the figure.
  plt.show()
(venv) ➜  make-lesson git:(main) ✗ sudo apt-get install python3-tk
```
    - Solução encontrada no [stackoverflow](https://stackoverflow.com/questions/56656777/userwarning-matplotlib-is-currently-using-agg-which-is-a-non-gui-backend-so)
```
$ sudo apt-get install python3-tk
```
  - [Incremental build](http://swcarpentry.github.io/make-novice/reference#incremental-build) - Para construir um arquivo make avalia a última atualização dos arquivos alvo e suas dependências. Caso alguma dependência tenha sido atualizada então make executa novamente o comando para recriar o alvo
  - [phony target](http://swcarpentry.github.io/make-novice/reference#phony-target), mostra ao make que o comando não construirá nada (para seguir uma sequência de scripts, por exemplo)
```
.PHONY : clean
clean :
  rm -f *.dat
```

- Modificação na linha 21 do módulo testzipf.py. Necessário para adaptar a criação da nova estrutura do projeto, pasta data
```
# linha original
bookname = input_file[:-4]
```

- Somente mostrar o comando que será rodado
```
$ make -n <comando>
```
