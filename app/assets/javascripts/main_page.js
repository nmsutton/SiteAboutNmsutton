function processNavBarLink(url) {
	$("#iframe").attr('src', url);
}

//<script defer="defer">
xRotation = 4.0;
yRotation = 1.0;
var canvasWidth = window.innerWidth;
var canvasHeight = 200;
cubesWidth = 30;
cubesHeight = 100;
cubesDepth = 10;

// revolutions per second
var angularSpeed = 0.2;
var lastTime = 0;

// this function is executed on each animation frame
function animate() {
	// update
	var time = (new Date()).getTime();
	var timeDiff = time - lastTime;
	var angleChange = angularSpeed * timeDiff * 2 * Math.PI / 1000;

	//cube.rotation.y += angleChange;
	lastTime = time;

	// render
	renderer.render(scene, camera);

	// request new frame
	requestAnimationFrame(function() {
		animate();
	});
}

// renderer
var renderer = new THREE.CanvasRenderer();
renderer.setSize(canvasWidth, canvasHeight);
document.body.appendChild(renderer.domElement);

// camera
var camera = new THREE.PerspectiveCamera(50, (canvasWidth * .1) / canvasHeight, 1, 1000);
camera.position.z = 400;

// scene
var scene = new THREE.Scene();

// cube
var Cube1Texture = new THREE.MeshLambertMaterial({
	map : THREE.ImageUtils.loadTexture("assets/Cube1Texture.jpg")
});
var cube1 = new THREE.Mesh(new THREE.CubeGeometry(cubesWidth, cubesHeight, cubesDepth), Cube1Texture);
cube1.overdraw = true;
cube1.position.x = -70;
cube1AdjustedMouseX = 50;
cube1AdjustedMouseY = 0;
scene.add(cube1);

var Cube2Texture = new THREE.MeshLambertMaterial({
	map : THREE.ImageUtils.loadTexture("assets/Cube2Texture.jpg")
});
var cube2 = new THREE.Mesh(new THREE.CubeGeometry(cubesWidth, cubesHeight, cubesDepth), Cube2Texture);
cube2.overdraw = true;
cube2.position.x = -35;
cube2AdjustedMouseX = 50;
cube2AdjustedMouseY = (window.innerWidth * .25);
scene.add(cube2);

var Cube3Texture = new THREE.MeshLambertMaterial({
	map : THREE.ImageUtils.loadTexture("assets/Cube3Texture.jpg")
});
var cube3 = new THREE.Mesh(new THREE.CubeGeometry(cubesWidth, cubesHeight, cubesDepth), Cube3Texture);
cube3.overdraw = true;
cube3.position.x = 0;
cube3AdjustedMouseX = 50;
cube3AdjustedMouseY = (window.innerWidth * .5);
scene.add(cube3);

var Cube4Texture = new THREE.MeshLambertMaterial({
	map : THREE.ImageUtils.loadTexture("assets/Cube4Texture.jpg")
});
var cube4 = new THREE.Mesh(new THREE.CubeGeometry(cubesWidth, cubesHeight, cubesDepth), Cube4Texture);
cube4.overdraw = true;
cube4.position.x = 40;
cube4AdjustedMouseX = 50;
cube4AdjustedMouseY = (window.innerWidth * .75);
scene.add(cube4);

var Cube5Texture = new THREE.MeshLambertMaterial({
	map : THREE.ImageUtils.loadTexture("assets/Cube5Texture.jpg")
});
var cube5 = new THREE.Mesh(new THREE.CubeGeometry(cubesWidth, cubesHeight, cubesDepth), Cube5Texture);
cube5.overdraw = true;
cube5.position.x = 80;
cube5AdjustedMouseX = 50;
cube5AdjustedMouseY = (window.innerWidth);
scene.add(cube5);

// start animation
animate();

$(document).ready(function() {
	$('#myCanvas').mousemove(function(event) {
		//adjustedMouseX = (event.pageX + xRotation) * 0.001;
		//adjustedMouseY = (event.pageY + yRotation) * 0.001;
		cube1.rotation.x = (event.pageY - cube1AdjustedMouseX) * (xRotation * 0.001);
		cube1.rotation.y = (event.pageX - cube1AdjustedMouseY) * (yRotation * 0.001);
		//adjustedMouseX = (event.pageX + xRotation) * 0.003;
		//adjustedMouseY = (event.pageY + yRotation) * 0.003;
		cube2.rotation.x = (event.pageY - cube2AdjustedMouseX) * (xRotation * 0.001);
		cube2.rotation.y = (event.pageX - cube2AdjustedMouseY) * (yRotation * 0.001);
		//adjustedMouseX = (event.pageX + xRotation) * 0.005;
		//adjustedMouseY = (event.pageY + yRotation) * 0.005;
		cube3.rotation.x = (event.pageY - cube3AdjustedMouseX) * (xRotation * 0.001);
		cube3.rotation.y = (event.pageX - cube3AdjustedMouseY) * (yRotation * 0.001);
		//adjustedMouseX = (event.pageX + xRotation) * 0.003;
		//adjustedMouseY = (event.pageY + yRotation) * 0.003;
		cube4.rotation.x = (event.pageY - cube4AdjustedMouseX) * (xRotation * 0.001);
		cube4.rotation.y = (event.pageX - cube4AdjustedMouseY) * (yRotation * 0.001);
		//adjustedMouseX = (event.pageX + xRotation) * 0.001;
		//adjustedMouseY = (event.pageY + yRotation) * 0.001;
		cube5.rotation.x = (event.pageY - cube5AdjustedMouseX) * (xRotation * 0.001);
		cube5.rotation.y = (event.pageX - cube5AdjustedMouseY) * (yRotation * 0.001);
	});

	$('#myCanvas').mousedown(function(event) {
		mouseY = event.pageY;
		mouseX = event.pageX;
		minY = 60, maxY = 120, minX = (window.innerWidth * .25), maxX = (window.innerWidth * .35);
		if (mouseY >= minY & mouseY <= maxY & mouseX >= minX & mouseX <= maxX)
			window.location.href = "http://nmsutton.heroku.com";

		minX = (window.innerWidth * .355), maxX = (window.innerWidth * .45);
		if (mouseY >= minY & mouseY <= maxY & mouseX >= minX & mouseX <= maxX)
			processNavBarLink('/work_category_content/choose_work_category.html');

		minX = (window.innerWidth * .455), maxX = (window.innerWidth * .55);
		if (mouseY >= minY & mouseY <= maxY & mouseX >= minX & mouseX <= maxX)
			processNavBarLink('/tag_navigator/tag_navigator.html');

		minX = (window.innerWidth * .555), maxX = (window.innerWidth * .65);
		if (mouseY >= minY & mouseY <= maxY & mouseX >= minX & mouseX <= maxX)
			processNavBarLink('/work_experience_extractor/ExtractExperienceSections.html');

		minX = (window.innerWidth * .655), maxX = (window.innerWidth * .75);
		if (mouseY >= minY & mouseY <= maxY & mouseX >= minX & mouseX <= maxX)
			processNavBarLink('http://nmsutton.github.io/Resume/NateSuttonResume.html');
	});
});