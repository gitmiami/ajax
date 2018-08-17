function id(arg) {
	return document.getElementById(arg);
}
function idv(arg) {
	return document.getElementById(arg).value;
}

function tn(arg) {
  return document.getElementsByTagName(arg);
}

//var getHttpObject = function() {
function getXhrObj() {
  var xmlhttp;
  if (window.ActiveXObject){
    try {
      xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e){
      try {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E){
        xmlhttp = false;
      }
    }
	}else if (window.XMLHttpRequest) {
    try {
      xmlhttp = new XMLHttpRequest();
    } catch (e) {
      xmlhttp = false;
    }
  }
  return xmlhttp;
}

function getXhrObj() {
  var xhrObj;
	if (window.XMLHttpRequest) {
    try {
      xhrObj = new XMLHttpRequest();
    } catch (e) {
      xhrObj = false;
    }
  }else if (window.ActiveXObject){
    try {
      xhrObj = new ActiveXObject("Msxml2.XMLHTTP");
    } catch (e){
      try {
        xhrObj = new ActiveXObject("Microsoft.XMLHTTP");
      } catch (E){
        xhrObj = false;
      }
    }
	}
  return xhrObj;
}

function getsyn(prog){
	var xhrObj = getXhrObj();
  xhrObj.open("get", prog, false);
  xhrObj.send(null);
  return xhrObj.responseText;
}

function getasyn(prog, func){
	var xhrObj = getXhrObj();
  xhrObj.open("get", prog);
	xhrObj.setRequestHeader("If-Modified-Since", "01 Jan 2000 00:00:00 GMT");
	xhrObj.onreadystatechange = function(){
    if(xhrObj.readyState == 4){
      if(xhrObj.status == 200){
        //var resp = xhrObj.responseText;
				//func(resp);
        func(xhrObj.responseText);
      }
    }
  }
  xhrObj.send(null);
}


function postsyn(prog, indata){
	var xhrObj = getXhrObj();
  xhrObj.open("post", prog, false);
  xhrObj.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhrObj.send(indata);
  return xhrObj.responseText;
}

function getsynx(prog){
	var xhrObj = getXhrObj();
  xhrObj.open("get", prog, false);
  xhrObj.send(null);
  return xhrObj.responseXML;
}

function postsynx(prog, indata){
	var xhrObj = getXhrObj();
  xhrObj.open("post", prog, false);
  xhrObj.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
  xhrObj.send(indata);
  return xhrObj.responseXML;
}

function addListener(eSrc, eType, eFunc, cap){
  if(eSrc.attachEvent){
    eSrc.attachEvent('on' + eType, eFunc);
  }else if(eSrc.addEventListener){
    eSrc.addEventListener(eType, eFunc, cap);
  }else {
    alert('No support on your Browser');
    return false;
  }
}

function setListener(observer, eventType, callFunc){
  if(observer.attachEvent){
    observer.attachEvent('on' + eventType, callFunc);
  }else if(observer.addEventListener){
    observer.addEventListener(eventType, callFunc, false);
  }else {
    alert('No support on Your Browser');
    return false;
  }
}

function getetype(e){ 
	if(!e) var e = window.event;
	return e.type;
}

function getid(e){ 
	var tgt;
	if(!e) var e = window.event;
	if(e.srcElement){  // Microsoft
    tgt = e.srcElement.id;
		if(tgt.nodeType == 3)
			tgt = tgt.rapentNode;
  }else if(e.target){ // W3C/Netscape 
    tgt = e.target.id;
  }else{
    //return false;
    tgt = false;
  }
	return tgt;
	//if(tgt.nodeType == 3)
	//	tgt = tgt.rapentNode;
}

function getkcode(e){ 
	if(!e) var e = window.event;
	if(e.keyCode){
    return e.keyCode;
  }else if(e.which){
    return e.which;
  }else{
    return false;
  }
}

function getkchar(e){ 
	var code;
	if(!e) var e = window.event;
	if(e.keyCode){
    code = e.keyCode;
  }else if(e.which){
    code = e.which;
  }else{
    code = false;
  }
	if(code)
		return String.fromCharCode(code);
	else
		return code;   
}

function mbutton(e){
  var click;
  if(!e) var e = window.event;
  if (e.which){
    if(e.which == 1){
      click = "L";
    }else if(e.which == 3){
      click = "R";
    }
  }else if (e.button){
    if(e.button == 1){
      click = "L";
    }else if(e.button == 2){
      click = "R";
    }
  }else{
    click = "F";
  }
  return click;
}
function setItems(fid, len){
  var items = new Array();
  var baseNode = id(fid).parentNode.parentNode;
  for(var i = 0; i < len; i++){
    items.push(baseNode.childNodes[1].firstChild.value);
    if(i < (len - 1)){
      baseNode = baseNode.nextSibling;
    }
  }
  return items;
}

function dispItems(dat, fid, len){
  var baseNode = id(fid).parentNode;
  for(var i = 0; i < dat.length; i++){
    baseNode.childNodes[1].innerHTML = dat[i];
    if(i < (dat.length - 1)){
      baseNode = baseNode.nextSibling;
    }
  }
}

function idispItems(dat, fid, len){
	if(len){
		var length = len;
	}else{
		var length = dat.length;
	}
  var baseNode = id(fid).parentNode.parentNode;
  for(var i = 0; i < length; i++){
    baseNode.childNodes[1].firstChild.value = dat[i];
    if(i < (length - 1)){
      baseNode = baseNode.nextSibling;
    }
  }
}
