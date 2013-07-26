//
//  main.c
//  PlayerDemo
//
//  Created by pplive on 7/25/13.
//  Copyright (c) 2013 pplive. All rights reserved.
//

#import <SDL.h>
#import "MainView.h"
#import <../src/video/uikit/SDL_uikitwindow.h>

#define SCREEN_WIDTH 320
#define SCREEN_HEIGHT 480

static SDL_Renderer *renderer;

int
main_main(int argc, char *argv[])
{
    
    SDL_Window *window;
    SDL_Event event;            /* last event received */
    
    //player_init();
    
    /* create window */
    window = SDL_CreateWindow("iPhone keyboard test", 0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, 0);
    /* create renderer */
    renderer = SDL_CreateRenderer(window, -1, 0);

    SDL_WindowData *data = (SDL_WindowData *) window->driverdata;
    UIWindow *uiwindow = data->uiwindow;
    uiwindow.rootViewController = [[[MainView alloc]initWithNibName:@"MainView" bundle:nil]autorelease];

    uiwindow.backgroundColor = [UIColor whiteColor];
    [uiwindow makeKeyAndVisible];

    int done = 0;
    /* loop till we get SDL_Quit */
    while (SDL_WaitEvent(&event)) {
        switch (event.type) {
            case SDL_QUIT:
                done = 1;
                break;
        }
    }
    return 0;
}
