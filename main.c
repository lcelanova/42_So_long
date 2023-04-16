/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lmunoz-f <lmunoz-f@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/04/16 14:25:51 by lmunoz-f          #+#    #+#             */
/*   Updated: 2023/04/16 16:13:10 by lmunoz-f         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "mlx.h"

#define WINDOW_WIDTH 800
#define WINDOW_HEIGHT 600
#define SQUARE_SIZE 20

typedef struct s_data {
    void *mlx;
    void *win;
    int square_x;
    int square_y;
} t_data;

void draw_square(t_data *data, int x, int y) {
    for (int i = 0; i < SQUARE_SIZE; i++) {
        for (int j = 0; j < SQUARE_SIZE; j++) {
            mlx_pixel_put(data->mlx, data->win, x + i, y + j, 0xFFFFFF);
        }
    }
}

int key_hook(int keycode, t_data *data) {
    if (keycode == 65307) { // ESC
        mlx_destroy_window(data->mlx, data->win);
        return(0);
    }

    if (keycode == 119) { // W
        data->square_y -= SQUARE_SIZE;
    } else if (keycode == 97) { // A
        data->square_x -= SQUARE_SIZE;
    } else if (keycode == 115) { // S
        data->square_y += SQUARE_SIZE;
    } else if (keycode == 100) { // D
        data->square_x += SQUARE_SIZE;
    }

    mlx_clear_window(data->mlx, data->win);
    draw_square(data, data->square_x, data->square_y);

    return (0);
}

int main() {
    t_data data;

    data.mlx = mlx_init();
    data.win = mlx_new_window(data.mlx, WINDOW_WIDTH, WINDOW_HEIGHT, "Move the square");
    data.square_x = WINDOW_WIDTH / 2 - SQUARE_SIZE / 2;
    data.square_y = WINDOW_HEIGHT / 2 - SQUARE_SIZE / 2;

    draw_square(&data, data.square_x, data.square_y);

    mlx_key_hook(data.win, key_hook, &data);
    mlx_loop(data.mlx);

    return (0);
}