<?php include("../style/header1.php")?> 
<?php include("../style/menu.php")?>
<?php include("../style/header2.php")?>
			<div id="content">
					<div class="box">
                        <h2><center>Facial Recognition and Social Media</center></h2> <br><br>
                        <h3><center>Abstract</center></h3>
                        <p>
                        In this project I attempt to show that even if people untagged incriminating pictures of themselves on Facebook that they were still available and could be found easily.  Facebook, iPhoto, and Picassa already have face-recognition software that they can easily run to find your face all over the internet.  They even have your help, because you have already tagged so many pictures of your face for these Internet giants to create models from.
                        </p>
                        <br><br>
                        <h3><center>Materials & Methods </center></h3>
                        <p>
                        Hadoop is an obvious solution for processing large amounts of data.  All other tools I used (Ruby/Python/Bash) were used due to my own familiarity and API to interact with Facebook/Hadoop.  It was also only able to find working command-line face recognition using PCA (The only kind I understood) in Python.  I needed to understand how to use it, because I had to change some of the provided code to suit my purposes.<br><br>
                        With Hadoop's parallelism, I believed that the time I saved writing the code in python could be mitigated by spinning off more instances.  Besides numpy is actually a really fast implementation of matrix algebra, so I didn't actually lose that much by not doing the computations in C or Java.
                        </p>
                        <p>
                        <br><br><h3><center>Results</center></h3>
                        <p>
                        My results in a single word were -- disastrous.  I had HUGE numbers of false positives ( greater than 95%).  I attribute this to four issues.
                        <ol>
                            <li>My Face Model only used 35 subjects this is not enough for good recognition</li>
                            <li>My heuristic to identify a person was simply having the best match score with each of the 35 faces in the library.  I should of simply processed the distanced between the polynomials that computed the fisher face, and then used some sort of smart thresholding.  I didn't do this because the purpose of this assignment was to use Haddop, not to process faces, and it would have taken a lot of trial/error and time.</li>
                            <li>I think I made the resolution of my face model too low.  I should have made it larger than 92 x 112 pixels.  I choose this value because that was the size of images in a face library I found on the Internet, but that face library was for detection not recognition.</li>
                            <li>Hair is such a HUGE issue.  As people change their hair-style over time the model of their face breaks down extremely quickly.</li>
                        </ol>
                        Here are some more comical false positives that the system gave to me.
                        </p>
                        <img class="aligntop" src="images/fb1.png" width="200" height="120" alt="" />
                        <img class="aligntop" src="images/fb2.png" width="200" height="120" alt="" />
                        <img class="aligntop" src="images/fb3.png" width="200" height="140" alt="" />
                        <p>
                        However I was able to achieve a high level of parallelism.  This system because it does not have any linear dependencies is a “trivially parallelizable system”.  I was able to use Hadoop to schedule the jobs and ensure scaling CPU utilization.<br><br>
                        It took A little over an hour and a half to do this analysis on ever image that I could access on Facebook.  That is 92581 images in over 90 minutes on 16 cores.<br><br>
                        The first step towards face-recognition is face detection.  I wrote my face-detection using a library “opencv” and it's python bindings.  The code for facial-recognition I found used python PIL.  Apparently the opencv python bindings are not yet stable, and so most of the documentation I found on line for it did not work for converting images between the two frameworks.<br><br>
                        Opencv is so not stable that it breaks whenever you try to import it into python on the red-hat Linux Distro that is used for automatically generating Hadoop EC2-clusters.  This meant that I was not able to use the good tools for creating a ec2-hadoop cluster and instead had to make it by hand out of the latest Ubuntu release.<br><br>
                        Apparently reading in images from std.in is incredibly difficult.  So difficult in fact that UVA's own Jason Lawrence created a library last year with Chris Sweeney and Sean Arietta under an NSF grant.  However this library works in Java, and by the time I realized I had this problem I had already written the face detector and face-recognition in python.<br><br>
                        This forced me into a work-around.  Instead of passing the images through the Hadoop file system, I passed file pointers, and stored the images on local disk.  This is not the worst thing in the world.  This allows me to have more fine-tuned control over the size of mapping jobs.  By passing text files with a list of file pointers to images I can easily optimize the Map time/ number of map jobs by changing the number of file pointers in each file.  The reason I didn't pass file pointers to within HDFS is because I couldn't find a *good* library for python for reading in and out of HDFS. <br><br>
                        This model however is not that bad for what I am doing here.  It is a computationally intensive process, not an I/O bound process.  I chose to put the image library on local disk instead of on some soft of virtual file system simply because it fit.  Putting it on a virtual file system would have been acceptable if the library did not fit on local disk. <br><br>
                        Not using HDFS did not ruin the point of using Hadoop, because Hadoop still scheduled and tracked the mapping jobs.  Even though the mapping jobs had the same number of images they did not take the same amount of time, because Facebook has variable image sizes.  This means that some cores completed more mapping jobs then others, and I would not have been able to do that with a system which statically distributed work. <br><br>
                        </p>
                        </div>
					<div class="box">
					</div>
<?php include("../style/footer.php")?> 
