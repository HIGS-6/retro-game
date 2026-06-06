use sola_raylib::prelude::*;

fn main() {
    let (mut rl, thread) = sola_raylib::init()
        .size(640, 480)
        .title("Retro Game")
        .build();

    while !rl.window_should_close() {
        let mut d = rl.begin_drawing(&thread);

        d.draw_text("Hello, world!", 10, 10, 28, Color::BLACK);
        d.clear_background(Color::WHEAT);
    }
}
