
# Experiment on document simlarity using a pretrained fastText model
# and the Word Movers Distance (WMD) using gensim implementation.
# Each of the  filepaths points to a document file that contains the
# clean tokenized version of one of the three libraries: Log4j, SLF4j and Spatial4j.
# Pairwise WMD is calculated for the pairs of documents by taking into
# their embedded word representations in the pretrained model
# java-ftskip-dim100-ws5.bin  [https://doi.org/10.5281/zenodo.2558730]
#

from gensim.models.wrappers import FastText

filepath_log4j='example-log4j-doc'
filepath_slf4j='example-slf4j-doc'
filepath_spatial4j='example-spatial4j-doc'

with open(filepath_log4j, 'r') as fl:
  log4j = fl.read()
  log4j_dat=log4j.split()

with open(filepath_slf4j, 'r') as fl:
  slf4j = fl.read()
  slf4j_dat=slf4j.split()

with open(filepath_spatial4j, 'r') as fl:
  spatial4j = fl.read()
  spatial4j_dat=spatial4j.split()

model = FastText.load_fasttext_format('java-ftskip-dim100-ws5.bin')

distance_spatial4j_sl4fj = model.wv.wmdistance(spatial4j_dat, slf4j_dat)
print('distance_spatial4j_sl4fj')
print("{:.4f}".format(distance_spatial4j_sl4fj))

distance_spatial4j_log4j = model.wv.wmdistance(spatial4j_dat, log4j_dat)
print('distance_spatial4j_log4j')
print("{:.4f}".format(distance_spatial4j_log4j))


distance_log4j_slf4j = model.wv.wmdistance(log4j_dat, slf4j_dat)
print('distance_log4j_slf4j')
print("{:.4f}".format(distance_log4j_slf4j))
