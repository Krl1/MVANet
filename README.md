[Click to go to base MVANet README.](MVANET_README.md)


## I. Requiremets

1. Clone this repository
```
git clone https://github.com/Krl1/MVANet.git
cd MVANet
```

2. Download and set images and models
```
./checkpoints/Model_80.pth 
./images/*.jpg
./swin_base_patch4_window12_384_22kto1k.pth
```

3.  Build and run docker

```
docker build --no-cache -t mvanet:1.0 .
docker run --gpus all --ipc=host --ulimit memlock=-1 -it -v $PWD:/workspace/MVANet mvanet:1.0
```

4. Run
```
python predict.py
```

5. Profile
```
python -m cProfile -o profile_results.prof predict.py
```
