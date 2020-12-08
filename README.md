# Target-Tracking-with-Pan-Tilt

Our aim is to model and control an acquisition and tracking system of a target. This system is built on top of a mobile robot "Rasteirinho" and will track the target using a combination of horizontal and vertical movement (Pan-Tilt). These movements are executed with the help of two servomotor through the acquisition of data from an end-effector camera. The main purpose of the proposed system is to keep the camera fixed on the target's centroid.


**Target:**

![](https://github.com/luis-a-miranda/Target-Tracking-with-Pan-Tilt/blob/main/images/target.png)

**Mobile Robot Protype:**

![](https://github.com/luis-a-miranda/Target-Tracking-with-Pan-Tilt/blob/main/images/rasteirinho.png)


## Results of optimal control approach (LQR)

**Rectilinear Trajectory:**
Horizontal Coordinates             |  Vertical Coordinates
:-------------------------:|:-------------------------:
![](https://github.com/luis-a-miranda/Target-Tracking-with-Pan-Tilt/blob/main/images/rectilinear%20trajectory%20-%20horizontal%20coordinates.png)  |  ![](https://github.com/luis-a-miranda/Target-Tracking-with-Pan-Tilt/blob/main/images/rectilinear%20trajectory%20-%20vertical%20coordinates.png)

**Circular Trajectory**
Horizontal Coordinates            |  Vertical Coordinates
:-------------------------:|:-------------------------:
![](https://github.com/luis-a-miranda/Target-Tracking-with-Pan-Tilt/blob/main/images/circular%20trajectory%20-%20horizontal%20coordinates.png)  |  ![](https://github.com/luis-a-miranda/Target-Tracking-with-Pan-Tilt/blob/main/images/circular%20trajectory%20-%20vertical%20coordinates.png)


### Conclusion
As expected the system is linear, observable, controllable and stable in closed-loop. Referring to the classical controllers, we arrived at three possible solutions using a P controller, a Lag Compensator and the Pole Placement method. Although these are able to control the system properly, they are not optimal and therefor we used the Linear Quadratic Regulator(LQR) to obtain the optimal solution. A State Observer was designed in order to every state variables become available. Implementing the LQR into the State Observer we verified its solution using a rectilinear and a circular trajectory.



