# Source Code *fastText* Embeddings
fastText pretrained models for semantic representations of source code in
Java, Python, PHP, C, C++ and C#.

## Model files
The pretrained models are stored in .bin files (of total approximate size 13 GB)
which can be accessed at this link:
https://doi.org/10.5281/zenodo.2558730


## Instructions on how to use the models
### Prerequisites
To load a model you will need to first build the
[fastText](https://fasttext.cc/) library following the
instructions: https://fasttext.cc/docs/en/support.html.
### Loading and querying the models
The official fastText documentation provides information on the library's
functionalities and examples on how you can use pretrained models.


#### Semantic similarity queries
Simple semantic similarity queries can be performed through the nearest
neighbor *nn* functionality of fastText.
Examples on how to load and query the pretrained Java model for nearest words.

```
../fastText/fasttext nn java-ftskip-dim100-ws5.bin
```
Find nearest words to:

 "toggleFullScreen"

```
Query word? toggleFullScreen
doToggleFullscreen 0.999999
FullScreen 0.999998
isNotMoveInScreen 0.999998
sFullScreen 0.999998
OSXFullScreen 0.999998
ToggleFullScreen 0.999998
toggleFullscreenAlbumArt 0.999998
fullScreen 0.999998
LoseScreen 0.999998
LooseScreen 0.999997
```
"BufferedInputStream"

```
Query word? BufferedInputStream
MyBufferedInputStream 1
TBufferedInputStream 1
BufferedFileInputStream 0.999999
maybeBufferInputStream 0.999999
LoggerBufferedInputStream 0.999999
BufferedBEROctetStream 0.999999
BufferedDataInputStream 0.999999
InputStreamBuffered 0.999999
byteBufferInputStream 0.999999
DirectBufferInputStream 0.999998
```
"writeLine"

```
Query word? writeLine
writeMine 0.999999
writeAsLine 0.999998
writeWChar 0.999998
writeLineBreak 0.999998
writeLocks 0.999998
writeTermTo 0.999998
writeABook 0.999998
writeRowStart 0.999998
writeElided 0.999998
writeRowEnd 0.999998
```

#### Analogy queries
Analogies may drawn through the information embedded in word vectors.
This can be done with the *analogies* functionality of fastText.
For example, in a general knowledge representation model
the analogy "Berlin is to Germany what Paris to France"
will be retrieved when given the relevant word triplets in this format:
Query triplet (A - B + C)? Berlin Germany France

Example of an analogy query in the pretrained Java model

```
../fastText/fasttext analogies java-ftskip-dim100-ws5
Query triplet (A - B + C)? OutputStreamReader OutputStream InputStream
inputStreamReader 0.999999
InputStreamCSVReader 0.999998
inputStreamName 0.999998
BitStreamReader 0.999997
SlimStreamReader 0.999997
objectStreamReader 0.999997
flStreamReader 0.999997
inStreamReader 0.999997
getDecompressingInputStream 0.999997
resetStream 0.999997
```
