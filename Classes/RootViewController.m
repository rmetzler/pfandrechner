//
//  RootViewController.m
//  pfandrechner
//
//  Created by Richard Metzler on 27.02.11.
//  Copyright 2011 Metzler. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

#import "RootViewController.h"
#import "ProductCell.h"
#import "Product.h"

#import "RMURLAlert.h"

#import "FlurryAPI.h"

/*
@interface UILabel (BPExtensions)
- (void)sizeToFitFixedWidth:(NSInteger)fixedWidth;
@end

@implementation UILabel (BPExtensions)


- (void)sizeToFitFixedWidth:(NSInteger)fixedWidth
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, fixedWidth, 0);
    self.lineBreakMode = UILineBreakModeWordWrap;
    self.numberOfLines = 0;
    [self sizeToFit];
}
@end
*/

@implementation RootViewController

@synthesize urlAlert;

#pragma mark consts

//#define kCustomCellNib @"ProductCell"
//#define kCustomCellNib @"ProductCellv2"
//#define kCustomCellNib @"ProductCellv3"
//#define kCustomCellNib @"ProductCellv4"
//#define kCustomCellNib @"ProductCellv5"
#define kCustomCellNib @"ProductCellv6"
//#define kCustomCellNib @"ProductCellv7"

//#define kStyle @"img1"
//#define kStyle @"img2" 
//#define kStyle @"img3" 
//#define kStyle @"img4" 
#define kStyle @"img5" 

#pragma mark -
#pragma mark View lifecycle

//TODO: Einkauf dazurechnen
//Wie teuer ist eine Flasche beim Einkauf?


- (void)viewDidLoad {
    [super viewDidLoad];
	
    self.urlAlert = [[RMRecurringURLAlert alloc] initWithURLString:@"http://itunes.apple.com/de/app/pfandrechner/id433252145?mt=8" period:3];
    [self.urlAlert
     showAlertWithMessage:@"Sind Sie zufrieden?\nHaben Sie Verbesserungs- vorschläge für den Pfandrechner?\nBitte bewerten Sie jetzt unsere Pfandrechner App im AppStore!"
     deferText:@"Später"
     actionText:@"Bewerten"];
    
	UIBarButtonItem *resetButton = [[UIBarButtonItem alloc] 
									initWithTitle:@"Reset"
									style:UIBarButtonItemStyleBordered 
									target:self action:@selector(reset:)];
	
	self.navigationItem.leftBarButtonItem = resetButton;
	
	[resetButton release];
	
	
	array = [[NSArray alloc] initWithObjects:
			 [[[Product alloc] initWithPrice:0.15 image: @"limo.png"    description: @"Glasflasche Mehrweg"] autorelease],
			 [[[Product alloc] initWithPrice:0.15 image: @"cola.png"    description: @"Plastikflasche Mehrweg"] autorelease],
			 [[[Product alloc] initWithPrice:0.25 image: @"wasser.png"  description: @"Plastikflasche Einweg"] autorelease],
			 [[[Product alloc] initWithPrice:0.08 image: @"bier2.png"   description: @"Bierflasche (Glas)"] autorelease],
			 [[[Product alloc] initWithPrice:0.15 image: @"bier1.png"   description: @"Bierflasche mit Bügel (Glas)"] autorelease],
			 [[[Product alloc] initWithPrice:0.25 image: @"dose.png"   description: @"Dose"] autorelease],
			 [[[Product alloc] initWithPrice:0.15 image: @"joghurt.png" description: @"Joghurt Glas"] autorelease],
			 [[[Product alloc] initWithPrice:1.50 image: @"kasten1.png" description: @"Kasten (leer)"] autorelease],
			 [[[Product alloc] initWithPrice:0.75 image: @"kasten2.png" description: @"Halber Kasten (leer)"] autorelease],
			 nil];

	for (Product *p in array) {
		[p addObserver:self forKeyPath:@"product" options:0 context:nil];
	}
	

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
*/

/*
 // Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// Return YES for supported orientations.
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
 */


#pragma mark -
#pragma mark Table view data source

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [array count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView 
		 cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"ProductCellIdentifier";
    
    ProductCell *cell = (ProductCell *) [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
	if (cell == nil) {
		NSString *nibFile = [ [NSUserDefaults standardUserDefaults] stringForKey:@"button_position"];
		if (nil == nibFile) {
			nibFile = kCustomCellNib;
		}
		NSArray *nib =[[NSBundle mainBundle] loadNibNamed:nibFile
													owner:self 
												  options:nil];
		
        cell = [nib objectAtIndex:0];
		
		CAGradientLayer *gradient = [CAGradientLayer layer];
		gradient.frame = cell.bounds;
		gradient.colors = [NSArray arrayWithObjects:
						   (id) [[UIColor whiteColor] CGColor],
						   (id) [[UIColor lightGrayColor] CGColor],
						   nil];
		[cell.layer insertSublayer:gradient atIndex:0];
		
	} else {
		// NSLog(@"Cell reused");
	}


    
	// Configure the cell.
	Product* product = [array objectAtIndex:[indexPath row]];
	
	cell.product = product;
	
	cell.imageView.image = [UIImage imageNamed: 
							[NSString stringWithFormat:@"%@/%@", kStyle,	product.image]];
	
	cell.nameLabel.text = product.description;
	cell.priceLabel.text = [NSString stringWithFormat:@"%1.2f€",product.multiplicant];
	
	
	[cell updateCount:nil];
	
	[product addObserver:self forKeyPath:@"multiplier" options:NSKeyValueChangeSetting context:cell];
	
    return cell;
}

- (CGFloat)tableView:(UITableView *) tableView heightForRowAtIndexPath:(NSIndexPath *) indexPath {
	
	return kTableViewRowHeight;
}

/*
// Override to support conditional editing of the table view.
- (BOOL) tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void) tableView:(UITableView *)tableView 
moveRowAtIndexPath:(NSIndexPath *)fromIndexPath 
	   toIndexPath:(NSIndexPath *)toIndexPath {
	
	// TODO: rearrange
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	
	NSLog(@"%s", __FUNCTION__);
	
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	NSLog(@"%s", __FUNCTION__);
	
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[array release];
	[urlAlert release];
    
    [super dealloc];
}

#pragma mark -
#pragma mark IBActions


-(void) calculate {

	// alles zusammen addieren ...
	double total = 0;
	for(Product *p in array) {
		total += [p.product doubleValue];
	}

	//NSLog(@"Gesamt: %f", total);

	// ... und als title setzen ...
	self.title = [NSString stringWithFormat:@"Gesamt: %.2f €", total];
	
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
					  ofObject:(id)object 
						change:(NSDictionary *)change 
					   context:(void *)context
{
	
	[self calculate];

}

- (void) logResetToFlurry {
	
/*
	
	// TODO: nur loggen, wenn irgendwas drin stand
	 
	NSMutableDictionary *dict = [[NSMutableDictionary dictionary] autorelease];
	
	for (Product *p in array) {
		if (p.multiplier) {
			dict setObject: [NSNumber numberWithInt:p.multiplier] forKey:(id)p.description];
		}
		[p resetMultiplier];
	}
	
	[FlurryAPI logEvent:@"RESET" withParameters:dict];

*/
}

- (IBAction) reset:(id)sender {

	[self logResetToFlurry];
	
	for (Product *p in array) {
		[p resetMultiplier];
	}

	[self calculate];
	
	[self.tableView reloadData];

}

@end

