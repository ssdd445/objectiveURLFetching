@import Foundation;

int main(int argc,char *argv[])
{
    @autoreleasepool
    {
        NSURL *url = [NSURL URLWithString:@"http://www.google.com/images/logos/ps_logo2.png"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        NSError *error = nil;
        NSData *data = [NSURLConnection sendSynchronousRequest:request
                                             returningResponse:NULL
                                                         error:&error];
        
        if (!data) {
            NSLog(@"failed to fetch data: %@",[error localizedDescription]);
            return 1;
        }
        NSLog(@"The file is %lu bytes",(unsigned long)[data length]);
        BOOL written = [data writeToFile:@"/Users/saudwaqar/Desktop/C/newFile.png"
                                 options:0
                                   error:&error];
        if (!written ) {
            NSLog(@"write failed: %@",[error localizedDescription]);
            return 1;
        }
        NSLog(@"Success");
    }
    return 0;
}