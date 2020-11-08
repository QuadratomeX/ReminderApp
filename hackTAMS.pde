/* Harrison Hart & Viktor Harrington
 hackTAMS Coding Competition
 Reminder App */


int realH, realM, realS, timeSetting, hour, minute, second;
int alarmHour, alarmMinute, alarmSecond, upcomingH, upcomingM;
int displayH, displayM;
boolean singM, singS;
String dayNight, textBox, timeDurat, time, reminderTitle, upcomingMin;
PImage submit;

void setup() {
  size(500, 500);
  dayNight = "PM";
  textBox = "Reminder Title Here";
  timeDurat = "Hour";
  timeSetting = 01;
}

void draw() {
  submit = loadImage("checkMark.png");
  realH = hour();
  realM = minute();
  realS = second();


  if (alarmHour == realH && alarmMinute == realM && alarmSecond == realS) {
    frameRate(3);
    background(random(255), random(255), random(255));
  } else {
    background(255);
    frameRate(60);
  }

  if (realH - 12 > 0) {
    dayNight = "PM";
    realH -= 12;
  } else if (realH - 12 < 0) {
    dayNight = "AM";
  }

  fill(0);

  if (realM < 10) {
    singM = true;
  } else {
    singM = false;
  }

  if (realS < 10) {
    singS = true;
  } else {
    singS = false;
  }

  if (singS == true) {
    textSize(25);
    text("0" + realS, width/2, height/2-105);
  } else {
    textSize(25);
    text(realS, width/2, height/2-105);
  }

  if (singM == true) {
    text("0" + realM + ": ", width/2-45, height/2-105);
  } else {
    text(realM + ": ", width/2-45, height/2-105);
  }

  text(realH + ":", width/2-95, height/2-105);
  text(dayNight, width/2+45, height/2-105);

  // Reminder Title Box
  fill(255);
  stroke(0);
  strokeWeight(1);
  textSize(12);
  rect(width/2-width/2/2/2-5, height/2, 130, 30);
  fill(0);
  text(textBox, width/2-width/2/2/2+5, height/2+20);

  // Time Setting Box
  fill(255);
  stroke(0);
  strokeWeight(1);
  textSize(12);
  rect(width/2-width/2/2/2-5, height/2+height/2/2/2-25, 90, 45);
  fill(0);
  text(timeSetting, width/2-width/2/2/2+10, height/2+height/2/2/2+2);

  if (timeSetting > 1) {
    text(timeDurat + "s", width/2-width/2/2/2/2/2/2-25, height/2+height/2/2/2+2);
  } else if (timeSetting <= 0) {
    text(timeDurat + "s", width/2-width/2/2/2/2/2/2-25, height/2+height/2/2/2+2);
  } else {
    text(timeDurat, width/2-width/2/2/2/2/2/2-25, height/2+height/2/2/2+2);
  }

  // Up Arrow Button
  fill(255);
  stroke(0);
  strokeWeight(1);
  textSize(12);
  rect(width/2-width/2/2/2/2/2/2+35, height/2+height/2/2/2-25, 35, 20);
  fill(0);
  text("^", width/2-width/2/2/2/2/2/2+50, height/2+height/2/2/2-10);

  // Down Arrow Button
  fill(255);
  stroke(0);
  strokeWeight(1);
  textSize(12);
  rect(width/2-width/2/2/2/2/2/2+35, height/2+height/2/2/2, 35, 20);
  fill(0);
  text("v", width/2-width/2/2/2/2/2/2+50, height/2+height/2/2/2+15);

  // Next Time Type Button
  fill(255);
  stroke(0);
  strokeWeight(1);
  textSize(12);
  rect(width/2-width/2/2/2/2/2/2+75, height/2+height/2/2/2-25, 30, 45);
  fill(0);
  text(">", width/2-width/2/2/2/2/2/2+85, height/2+height/2/2/2);

  // Time Submitter
  fill(255);
  stroke(0);
  strokeWeight(1);
  textSize(12);
  rect(width/2-width/2/2/2/2/2/2+75, height/2+height/2/2/2-62, 30, 30);
  fill(0);
  image(submit, width/2+71, height/2+5, 25, 25);


  text("Upcoming Reminder: \n" + reminderTitle + " in" + " " + displayH + "hour[s]" + " & " + displayM + "minute[s]", width/2-60, height/2+height/2/2);

  // Saves time based on what time is selected
  if (timeDurat == "Hour" || timeDurat == "Hours") {
    hour = timeSetting;
  } else if (timeDurat == "Minute" || timeDurat == "Minutes") {
    minute = timeSetting;
  } else if (timeDurat == "Second" || timeDurat == "Seconds") {
    second = timeSetting;
  }
}

void mousePressed() {
  // Turns Reminder Title Box into a "Text Field"
  if (mouseX >= 189 && mouseY >= 253 && mouseX <= 313 && mouseY <= 281) {
    textBox = "";
  }

  // Turns the Up Arrow into a Button
  if (mouseX >= 279 && mouseY >= 290 && mouseX <= 313 && mouseY <= 307) {
    if (timeSetting >= 59) {
      timeSetting = 1;
    } else {
      timeSetting += 1;
    }
  }

  //println(mouseX, mouseY);

  // Turns the Down Arrow into a Button
  if (mouseX >= 279 && mouseY >= 315 && mouseX <= 313 && mouseY <= 332) {
    if (timeSetting <= 0) {
      timeSetting = 59;
    } else {
      timeSetting -= 1;
    }
  }

  // Turns Next Arrow into a Button
  if (mouseX >= 319 && mouseY >= 290 && mouseX <= 348 && mouseY <= 333) {
    if (timeDurat == "Hour" || timeDurat == "Hours") {
      timeDurat = "Minute";
    } else if (timeDurat == "Minute" || timeDurat == "Minutes") {
      timeDurat = "Second";
    } else if (timeDurat == "Second" || timeDurat == "Seconds") {
      timeDurat = "Hour";
    }
  }

  // Turns Checkmark Submission into a Button
  if (mouseX >= 319 && mouseY >= 253 && mouseX <= 348 && mouseY <= 282) {
    alarmHour = realH + hour + 12;
    alarmMinute = realM + minute;
    alarmSecond = realS + second;
    if (alarmSecond >= 60) {
      alarmSecond -= 60;
      alarmMinute += 1;
    }
    if (alarmMinute >= 60) {
      alarmMinute -= 60;
      alarmHour += 1;
    }
    reminderTitle = textBox;
    displayH = hour;
    displayM = minute;
  }
}

void keyPressed() {
  if (textBox.length() <= 16) {
    textBox = textBox + key;
  }
}
