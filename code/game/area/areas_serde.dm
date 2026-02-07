/area/ShouldSerialize(_age)
	SHOULD_CALL_PARENT(TRUE)
	return ..() && !is_original // This is specifically if this area instance should serialize, not if the contents should.

/area/GetPossiblySerializableInstances()
	return list(src)
