# TODO

- iOS7 Barcode Kamera integration
- dieses Mediator Modul / Commandcenter einbauen

### iOS 7 Barcode Kamera integration

// Metadata Output
// Setup

-(void)setup:(AVCaptureSession *)session {
	
	AVCaptureMetadataOutput*metadataOutput = [[AVCaptureMetadataOutput alloc] init];
	[sessionaddOutput:metadataOutput]; [metadataOutput release];

	id<AVCaptureMetadataOutputObjectsDelegate>metadataDelegate = ...
	dispatch_queuequeue = ...
	
	[metadataOutputsetMetadataObjectsDelegate:metadataDelegatequeue:queue];
	NSArray *metadataTypes = @[AVMetadataObjectTypeAztecCode];
	[metadataOutputsetMetadataObjectTypes:metadataTypes];
}


// Metadata output delegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput
        didOutputMetadataObjects:(NSArray *)metadataObjects
        fromConnection:(AVCaptureConnection *)connection {

	for ( AVMetadataObject *object in metadataObjects ) {
	{
	     if ( [[object class] isKindOfClass: ..
	 }
}