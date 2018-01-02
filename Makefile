build:
	docker build -t matplotlib .

run:
	docker run -ti --rm --name matplotlib -v $(PWD):/wrk -w /wrk matplotlib ash

xvfb:
	docker exec matplotlib Xvfb :99

x11vnc:
	docker exec matplotlib ash -c "DISPLAY=:99 x11vnc"
