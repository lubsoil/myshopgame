//FUNKCJA ODPOWIEDZIALNA ZA ŁADOWANIE PLIKU JSON
function loadJSONFile(path){
	if(file_exists(path)){
	    var theJsonFile = file_text_open_read(path);
	    var theData = "";
	    while (!file_text_eof(theJsonFile))
	    {
	        theData += file_text_read_string(theJsonFile);
	        file_text_readln(theJsonFile);
	    }
	    file_text_close(theJsonFile);
		
	    var theJsonMap = json_decode(theData);
	    return theJsonMap;
	}else{
	    return undefined;
	}
}