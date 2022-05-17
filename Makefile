
pip:
	@pip3 --default-timeout=100 --retries=5 install --trusted-host=pypi.douban.com.cn -r requirements.txt
