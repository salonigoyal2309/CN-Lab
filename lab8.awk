BEGIN {

	recv=0;
	drop=0;
	size=0;

}

{
	time = $2
		
	if ($1 == "r") {
        recv++;
	size=size+$6;
	}
	
	if (time < startTime) {
		startTime = time
	}

	if($1 == "d"){
		drop++;
	}

	if (time > stopTime) {
		stopTime = time
	}

}
	
END {

printf("\nreceived_packets %d",recv);
printf("\ndropped_packets %d",drop);
printf("\nPDR is  : %d ",100*recv/(recv+drop));
printf("\nAverage Throughput[kbps] = %.2f\t StartTime=%.2f\t StopTime = %.2f\n", (size/(stopTime-startTime)),startTime,stopTime);
}
