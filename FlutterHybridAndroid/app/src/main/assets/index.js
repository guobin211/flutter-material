(() => {
	const jsbtn = document.getElementById("jsCallAndroid");
	const params = document.getElementById("params");
	jsbtn.addEventListener("click", () => {
		callAndroid("js call android");
	}, false);

	function callAndroid(params) {
		window.JSIUtils.jsCallAndroid(params);
	}
	
	function androidCallJs(params) {
		params.innerText = params;
		window.alert(`androidCallJs: ${params}`);
	}

	window.androidCallJs = androidCallJs;
})();