/** \brief Main entry to the application
 * 
 * 
 * --- build dependencies
 * sudo snap install --classic cmake
 * sudo apt install ninja-build
 * mkdir build
 * 
 * ---- test dependencies
 * git clone https://github.com/google/googletest.git
 * 
 * 
 * ---- building
 * cd build
 * cmake -GNinja ..
 * ninja
 * 
 * ---- executing the binary
 * cd build
 * ./SampleProject
 * 
 * ---- clean
 * cd build
 * ninja clean
 * 
 * ---- executing the tests
 * cd build/test
 * ./sample_project_test
 * 
 **/ 
#include <getopt.h>  /* command line parser */
#include <iostream>  /* printf */
#include <signal.h>  /* Ctrl C detect */

#include "debug.h"     /* Debug and diagnostics helper */

#define DEBUG_MAIN_INIT (1)
#if DEBUG_MAIN_INIT
    #define MAIN_PRINTF(...)           do{ printf(__VA_ARGS__); }while(0)
#else
    #define MAIN_PRINTF(...)            (void(0))
#endif /* DEBUG_MAIN_INIT */


/**
 * \brief Look out for signals to kill our process to handle gracefull
 * shutdown.
 * \param i_SigNum
 **/
static void main_SignalHandler(int i_SigNum)
{
	switch (i_SigNum)
	{
		case SIGINT:
			MAIN_PRINTF("\n\nSIGINT recieved, shutting down...\n");
            /** TDOD: add call for gracefull shutdown here
             **/ exit(1);
			break;
		case SIGTERM:
			MAIN_PRINTF("\n\nSIGTERM recieved, shutting down...\n");
            /** TDOD: add call for gracefull shutdown here
             **/exit(1);
			break;
	}
}

/**
 * \brief Main entry to the application
 * \param argc - argument counter
 * \param argv - string argument parameter array
 * 
 * \note Example of call:
 * 
 * ./SampleProject 
  **/ 
int main (int argc, char **argv)
{
 
	/* Setup our signal handlers */
	signal(SIGINT, main_SignalHandler);
	signal(SIGTERM, main_SignalHandler);

    printf("Hello World!");
    while(1){

    }
    
    return 0;
}
