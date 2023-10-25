clean:
	cargo clean
	rm -rfv frontend-wasm
	rm -rfv dist

debug:
	@wasm-pack build --target web --no-typescript --mode force --dev --out-name index --out-dir ../frontend-wasm ./frontend

tailwind-debug:
	./tailwindcss --input=input.css --output=output.css

build-debug: clean tailwind-debug debug
	@mkdir -pv dist
	@cp -rfv ./frontend-wasm dist
	@cp -fv ./index.html dist
	@cp -fv ./output.css dist
	@cp -fv ./index.js dist

python-server:
	python3 -m http.server --directory dist