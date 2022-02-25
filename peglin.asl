state("Peglin") {
	float flightTime : "mono-2.0-bdwgc.dll", 0x00497de8, 0xa0, 0xb40, 0x140, 0x110, 0x68, 0xa0, 0x160;

	ulong currentNode : "UnityPlayer.dll", 0x017cd188, 0xd0, 0x8, 0x70, 0x370, 0x20, 0x2d0, 0x20;
	ulong dataToLoad : "UnityPlayer.dll", 0x017cd760, 0xa8, 0xd0, 0x8, 0x70, 0xd0, 0x138;
}

startup {
	settings.Add("area1", true, "Area 1 Complete");
}

start {
	if(old.flightTime == 0 && current.flightTime > 0 && current.currentNode != 0){
		return true;
	}
}
reset {
	if(current.currentNode == 0){
		return true;
	}
}
split {
	if (settings["area1"] && current.dataToLoad == 0){
		return true;
	}
}
