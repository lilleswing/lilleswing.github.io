 <?php include("../style/header1.php")?> 
<?php include("../style/menu.php")?>
<?php include("../style/header2.php")?>
               
                <div id="content">
					<div class="box">
                        <h2><center>Clustering to Detect Intersection Traffic</center></h2> <br><br>
                        <h3><center>Abstract</center></h3>
                        <p>
                        This paper discusses the modeling of a “T” intersection using machine vision.  Specifically to know how long cars wait at traffic lights in the different directions, and how many cars go in and out in each direction.  Being able to ascertain this with a single camera setup could conceivably save time and money of Traffic engineers. <br> <br>
                        Clustering was used to accomplish the majority of these goals.   Cars were then identified as they went through the intersection by matching clusters representing vehicles.
                        </p>
                        <br><br>
                        <h3><center>Materials & Methods </center></h3>
                        <p>
                        A single web-camera was setup overlooking a T-intersection in the Charlottesville area.  This camera took images at approximately 2 frames per second over the course of four days. </p>
                        <center><img class="aligntop" src="images/traffic1.png" width="400" height="400" alt="" /></center>
                        <p>
                        The process for finding cars begins with a neutral frame with no cars in it.  This frame is then subtracted from all frames in the data set to highlight anomalies (cars) in the images.
                        </p>
                        <center><img class="aligntop" src="images/traffic2.png" width="300" height="300" alt="" /></center>
                        <p>
                        After subtracting out the background image, thresholding was applied, and all the non-zero values were clamped to one.
                        </p>
                        <center><img class="aligntop" src="images/traffic3.png" width="300" height="300" alt="" /></center>
                        <p>
                        After this the images were clustered.   A basic flood-fill clustering was used for this due to the clean nature of the data. The clusters were then thresholded based on size and position of the cluster.  Clusters farther away from the camera are allowed to be smaller than clusters closer to the camera.  
                        </p>
                        <center><img class="aligntop" src="images/traffic4.png" width="300" height="300" alt="" /></center>
                        <p>
                        Now the system has clusters which represent cars in each frame.  The lane that each car was in was determined by superimposing the center of mass of each cluster over a drawn picture representing the lanes.
                        </p>
                        <center><img class="aligntop" src="images/traffic5.png" width="300" height="300" alt="" /></center>
                        <p>
                        The system now represents each car as a 7 tuple.  The seven values are red intensity, green intensity, blue intensity, center of mass x, center of mass y, number of pixels, and lane.  This is computed for each frame of data. <br> <br>
                        Sequential frames are then compared to attempt to match cars to themselves in different frames.  This is done by seeing if the clusters are of similar color and size.  This enables the system determine traffic flow through the intersection, and waiting time at traffic lights.
                        </p>
                        <br><br><h3><center>Results</center></h3>
                        <p>
                        The system received mixed results.  Over a 10 minute time period the system was able to find 70% of cars over a ten minute time period.  However this required fine-tuning of various thresholding variables.  If cars were detected at stop lights their waiting time was accounted for properly.
                        </p>
                        <center><img class="aligntop" src="images/traffic5.png" width="300" height="300" alt="" /></center>
                        <p>
                        <a href=http://www.youtube.com/watch?v=O3mhxB5wQOk&feature=channel_video_title>This</a> is a video of 10 minutes of data; it goes from 6:10pm – 6:20pm.  The arrows signify the direction that the cars are determined to be going. <br> <br>
                        The system was unable to get accurate flows through the intersection due to mis-labeling and missing cars all-together.  In conclusion this system is not ready to replace people manually counting cars are they go through the intersection.
                        </p>
                        <br><br><h3><center>Discussion</center></h3>
                        <p>
                        This system does not handle a number of edge cases.  One example of this is dark vehicles.  The thresholding cannot tell the difference between dark cars and the road.  Instead it often picks up the windshield and front bumper of cars.  This causes errors in the tracking algorithm; because the color and size is off, and the system might mistake the cluster for a light colored car farther away from the camera.  Another issue is tinted windows sometimes split the car into two different clusters resulting in over counting. <br> <br>
                        Another issue with the system was very tall vehicles.  These vehicles center of mass was sometimes higher than the boundaries for the lanes that were created.  This causes the system to believe that the cars are in a higher lane than actuality. <br><br> 
                        Initially the system was build on HSV color format, however this provided poor highlighting results, so all calculations were converted to RGB. <br> <br>
                        Because the system has a low frame rate, it sometimes did not get all the data necessary to plot a car’s full path.  So heuristics were used for guessing a cars path from its lane and position.  This was done knowing that cars can go faster turning right and going straight than turning left through traffic.  Because of this if a car only appears in one lane it was assumed that it either stayed in its lane or turned right depending on its current location in the intersection. <br><br>
                        <a href=https://github.com/lilleswing/traffic_cluster>All matlab code can be found at my github.</a>
                        </p>
                        </div>
					<div class="box">
				</div>
<?php include("../style/footer.php")?> 
