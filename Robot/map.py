

from kivy.config import Config

Config.set('graphics', 'resizable', 'False')
Config.set('graphics', 'height', '600')
Config.set('graphics', 'width', '600')

from kivy.app import App
from kivy.graphics import Color
from kivy.graphics.vertex_instructions import Line, Rectangle, Triangle
from kivy.properties import Clock
from kivy.uix.widget import Widget
from kivy.core.window import Window

from I2C import *


class Robot(Widget):
    size = 30, 30
    pos = (15 + 60 * 4.5, 60 * 4.5 + 15)

    def __init__(self, **kwargs):
        super().__init__(**kwargs)
        with self.canvas.after:
            Color(1, 1, 1, 1)
            self.rect = Rectangle(pos=self.pos, size=self.size)
            Color(0,0,0,1)
            #self.arrow = [Rectangle(pos=, size=)


class Map(Widget):
    robot = Robot()

    def __init__(self,victim, **kwargs):
        super().__init__(**kwargs)
        self.victim=victim
        self.lines = [], []
        self.walls = [], []  # horizontal vertical
        self.exploredTiles = []
        self.victims = []
        self.strangeTiles = [], []  # black, checkpoints
        self._keyboard = Window.request_keyboard(self._keyboard_closed, self)
        self._keyboard.bind(on_key_down=self._on_keyboard_down)
        with self.canvas.after:
            Color(1, 1, 1, 1)
            self.start = Triangle(
                points=(
                    60 * 4.5 + 15 + 2.01, 60 * 4.5 + 15,
                    60 * 4.5 + 15 + 2.01, 60 * 5.5 - 15,
                    60 * 4.5 + 15 + 2.01 + 25.981, 60 * 5.5 - 30))
        with self.canvas.before:
            Color(1, 1, 1, .5)
            self.background = Rectangle(pos=self.pos, size=(600, 600))
            Color(0, 0, 0, 1)
            for i in range(-570, 1230, 60):
                self.lines[1].append(Line(points=(i, -570, i, 1230)))
            for i in range(-570, 1230, 60):
                self.lines[0].append(Line(points=(-570, i, 1230, i)))
        #self.devices = I2CDevices()
        self.moving = True
        self.movingProgression = 0
        self.ok = True
        self.directions = [
            [0, 0, 0, 0], [True, True, True, True], 0, [(1, 0), (-1, 0), (0, -1), (0, 1)]]
        # [chosen][not available] pointing [Δ coordinates for tile in front]

        self.coordinates = [0, 0]
        self.add_widget(self.robot)
        Clock.schedule_interval(self.update, 1/60)

    def _keyboard_closed(self):
        pass
    
    def actual_wall_builder(self):
        lasers = self.devices.lasers.tof_sensor
        if lasers[0].get_distance() < 20 and lasers[1].get_distance() < 20:
            if self.directions[2] == 0:
                    self.wall_builder(['h', 0, 1])
            if self.directions[2] == 1:
                    self.wall_builder(['h', 0, 0])
            if self.directions[2] == 2:
                    self.wall_builder(['v', 1, 0])
            if self.directions[2] == 3:
                    self.wall_builder(['v', 0, 0])
        if lasers[2].get_distance() < 20 and lasers[4].get_distance() < 20:
            if self.directions[2] == 0:
                    self.wall_builder(['h', 0, 0])
            if self.directions[2] == 1:
                    self.wall_builder(['h', 0, 1])
            if self.directions[2] == 2:
                    self.wall_builder(['v', 0, 0])
            if self.directions[2] == 3:
                    self.wall_builder(['v', 1, 0])
    def wall_builder(self, text):
        with self.canvas:
            Color(1, 0, 0)
            if text[0] == 'h':
                text.pop(0)
                text[0] = int(text[0])
                text[1] = int(text[1])
                self.walls[0].append(
                    Line(width=2,points=((4.5+text[0]) * 60, (4.5 + text[1]) * 60, (4.5 + text[0] + 1) * 60, (4.5 + text[1]) * 60)))
            if text[0] == 'v':
                text.pop(0)
                text[0] = int(text[0])
                text[1] = int(text[1])
                self.walls[1].append(
                    Line(width=2, points=((4.5 + text[0]) * 60, (4.5 + text[1]) * 60, (4.5 + text[0]) * 60, (4.5 + text[1] + 1) * 60)))
    def actual_victim_creator(self):
        if self.victim.get():
             with self.canvas.before:
                    Color(1, 0, 0)
                    ok = True
                    for cross in self.victims:
                        if cross[0].pos == ((self.coordinates[0] + self.directions[3][self.directions[2]][0]) * 60 + 20,
                                            (9 - self.coordinates[1] + self.directions[3][self.directions[2]][
                                                1]) * 60 + 5):
                            ok = False
                    if ok:
                        self.victims.append((
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60 + 20,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 + 5),
                                      size=(20, 50)),
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60 + 5,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 + 20),
                                      size=(50, 20))))
    def on_text(self, widget):
        # self.aim = tuple(widget.text.split())
        # self.x, self.y = self.aim
        text = widget.text.split()
        self.wall_builder(text)

    def update(self, dt):
        for directionI in range(len(self.directions[1])):
            self.directions[1][directionI] = False
        for hWall in self.walls[0]:
            if hWall.points[0] == 4.5*60 and hWall.points[1] == 4.5*60:
                self.directions[1][3] = True
            elif hWall.points[0] == 4.5*60 and hWall.points[1] == (4.5+1)*60:
                self.directions[1][2] = True
        for vWall in self.walls[1]:
            if vWall.points[0] == 4.5 * 60 and vWall.points[1] == 4.5 * 60:
                self.directions[1][0] = True
            elif vWall.points[0] == (4.5+1) * 60 and vWall.points[1] == 4.5 * 60:
                self.directions[1][1] = True
        for tile in self.strangeTiles[0]:
            if ((4.5 - self.directions[3][self.directions[2]][0]) * 60,
                (4.5 - self.directions[3][self.directions[2]][1]) * 60) == tile.pos:

                self.directions[1][self.directions[2]] = True
        if not self.moving:
            if self.directions[0][0] and not self.directions[1][0]:
                self.coordinates[0] -= 1
            elif self.directions[0][1] and not self.directions[1][1]:
                self.coordinates[0] += 1
            elif self.directions[0][2] and not self.directions[1][2]:
                self.coordinates[1] -= 1
            elif self.directions[0][3] and not self.directions[1][3]:
                self.coordinates[1] += 1
        if self.directions[0][self.directions[2]] and not self.directions[1][self.directions[2]]:
            self.moving = True
            self.movingProgression += 1
            for line in self.lines[0]:
                y_line = line.points[1] + self.directions[3][self.directions[2]][1]
                line.points = -570, y_line, 1230, y_line
            for line in self.lines[1]:
                x_line = line.points[0] + self.directions[3][self.directions[2]][0]
                line.points = x_line, -570, x_line, 1230
            for tile in self.exploredTiles:
                tile.pos = tile.pos[0] + self.directions[3][self.directions[2]][0], \
                           tile.pos[1] + self.directions[3][self.directions[2]][1]
            self.start.points = self.start.points[0] + self.directions[3][self.directions[2]][0], self.start.points[1] + \
                                self.directions[3][self.directions[2]][1], \
                                self.start.points[2] + self.directions[3][self.directions[2]][0], self.start.points[3] + \
                                self.directions[3][self.directions[2]][1], \
                                self.start.points[4] + self.directions[3][self.directions[2]][0], self.start.points[5] + \
                                self.directions[3][self.directions[2]][1]
            for hWall in self.walls[0]:
                xWall = hWall.points[0] + self.directions[3][self.directions[2]][0]
                yWall = hWall.points[1] + self.directions[3][self.directions[2]][1]
                hWall.points = xWall, yWall, xWall+60, yWall
            for vWall in self.walls[1]:
                xWall = vWall.points[0] + self.directions[3][self.directions[2]][0]
                yWall = vWall.points[1] + self.directions[3][self.directions[2]][1]
                vWall.points = xWall, yWall, xWall, yWall+60
            for victims in self.victims:
                for rect in victims:
                    rect.pos = rect.pos[0] + self.directions[3][self.directions[2]][0], \
                               rect.pos[1] + self.directions[3][self.directions[2]][1]
            for tile in self.strangeTiles[0]:
                tile.pos = tile.pos[0] + self.directions[3][self.directions[2]][0], \
                           tile.pos[1] + self.directions[3][self.directions[2]][1]
        ok = True
        if not (self.lines[1][0].points[0] % 60 - 30):
            for i in range(2):
                self.directions[0][i] = False

        if not (self.lines[0][0].points[1] % 60 - 30):
            for i in range(2, 4):
                self.directions[0][i] = False
        if not (self.lines[0][0].points[1] % 60 - 30) and not (self.lines[1][0].points[0] % 60 - 30):
            self.moving = False
            self.movingProgression = 0
        with self.canvas.before:
            Color(0, 1, 0, .5)
            if not self.moving:
                for tile in self.exploredTiles:
                    if tile.pos == (60 * 4.5, 60 * 4.5):
                        ok = False
                if ok:
                    self.exploredTiles.append(
                        Rectangle(pos=(60 * 4.5, 60 * 4.5), size=(60, 60)))
        #self.actual_wall_builder()
        self.actual_victim_creator()
    def _on_keyboard_down(self, keyboard, keycode, text, modifiers):
        if keycode[1] == 'b':
            with self.canvas.before:
                Color(0, 0, 0, 1)
                ok = True

                for tile in self.strangeTiles[0]:
                    if tile.pos == ((4.5 - self.directions[3][self.directions[2]][0]) * 60,
                                    (4.5 - self.directions[3][self.directions[2]][1]) * 60 + self.movingProgression):
                        ok = False
                if ok:
                    if self.directions[2] == 0:
                        self.strangeTiles[0].append(
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60 + self.movingProgression,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 ),
                                      size=(60, 60)))
                    if self.directions[2] == 1:
                        self.strangeTiles[0].append(
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60 -self.movingProgression,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60),
                                      size=(60, 60)))
                    if self.directions[2] == 2:
                        self.strangeTiles[0].append(
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 -self.movingProgression),
                                      size=(60, 60)))
                    if self.directions[2] == 3:
                        self.strangeTiles[0].append(
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 + self.movingProgression),
                                      size=(60, 60)))
                self.directions[2] -= 1 if self.directions[2] % 2 == 1 else -1
                for direction in self.directions[0]:
                    if direction:
                        self.directions[0][self.directions[2]] = True
        if not self.moving:
            if keycode[1] == 'left':
                self.directions[2] = 0
            elif keycode[1] == 'right':
                self.directions[2] = 1
            elif keycode[1] == 'up':
                self.directions[2] = 2
            elif keycode[1] == 'down':
                self.directions[2] = 3
            elif keycode[1] == 'spacebar':
                self.directions[0][self.directions[2]] = True
            elif keycode[1] == 'v':
                with self.canvas.before:
                    Color(1, 0, 0)
                    ok = True
                    for cross in self.victims:
                        if cross[0].pos == ((self.coordinates[0] + self.directions[3][self.directions[2]][0]) * 60 + 20,
                                            (9 - self.coordinates[1] + self.directions[3][self.directions[2]][
                                                1]) * 60 + 5):
                            ok = False
                    if ok:
                        self.victims.append((
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60 + 20,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 + 5),
                                      size=(20, 50)),
                            Rectangle(pos=((4.5 - self.directions[3][self.directions[2]][0]) * 60 + 5,
                                           (4.5 - self.directions[3][self.directions[2]][1]) * 60 + 20),
                                      size=(50, 20))))

            elif keycode[1] == 'r':
                if self.directions[2] == 0:
                    self.wall_builder(['h', 0, 1])
                if self.directions[2] == 1:
                    self.wall_builder(['h', 0, 0])
                if self.directions[2] == 2:
                    self.wall_builder(['v', 1, 0])
                if self.directions[2] == 3:
                    self.wall_builder(['v', 0, 0])
            elif keycode[1] == 'l':
                if self.directions[2] == 0:
                    self.wall_builder(['h', 0, 0])
                if self.directions[2] == 1:
                    self.wall_builder(['h', 0, 1])
                if self.directions[2] == 2:
                    self.wall_builder(['v', 0, 0])
                if self.directions[2] == 3:
                    self.wall_builder(['v', 1, 0])

        return True


class MapApp(App):
    def build(self):
        return Map(self.victim)

if __name__=='__main__':
    MapApp().run()
