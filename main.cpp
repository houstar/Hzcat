#include <iostream>
#include "captureVga.h"
#include "core/membufUtils.h"



int main(int argc,char *argv[])
{
	MemBufUtils membuf;
	if(membuf.open()){
		CaptureVGA *pCaptureVGAHandle= new CaptureVGA();
		if(pCaptureVGAHandle->init()){
			int count=25;
			while(count--){
				sleep(1);
				pCaptureVGAHandle->start();
			}
		}
		//pCaptureVGAHandle->CaptureVGATask(pCaptureVGAHandle);
		//CaptureVGA::CaptureVGATask(pCaptureVGAHandle);
		pCaptureVGAHandle->stop();
	}
	membuf.close();
	return 0;
}

