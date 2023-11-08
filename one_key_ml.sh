# wget https://raw.githubusercontent.com/mwidjaja1/DSOnMacARM/main/environment.yml

# conda env create --file=environment.yml --name tf_m1

source ~/miniforge3/bin/activate
conda activate tf_m1

function install_global_ml {
	# 7. Install TensorFlow dependencies from Apple Conda channel.

	conda install -c apple tensorflow-deps

	# 8. Install base TensorFlow (Apple's fork of TensorFlow is called tensorflow-macos).

	python -m pip install tensorflow-macos

	# 9. Install Apple's tensorflow-metal to leverage Apple Metal (Apple's GPU framework) for M1, M1 Pro, M1 Max, M1 Ultra, M2 GPU acceleration.

	python -m pip install tensorflow-metal

	# 10. (Optional) Install TensorFlow Datasets to run benchmarks included in this repo.

	python -m pip install tensorflow-datasets

	# 11. Install common data science packages.

	conda install jupyter pandas numpy matplotlib scikit-learn
}

install_global_ml
