S.log("[SLATE] -------------- Start Loading Config --------------");

// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : false
});

// Monitors
var monMain = "0";
var monRight = "right";
var monLeft = "left";

var leftFull = S.op("move", {
  "screen" : monLeft,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var rightFull = S.op("move", {
  "screen" : monRight,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var mainFull = S.op("move", {
  "screen" : monMain,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

// Operations
var lapChat = S.op("corner", {
  "screen" : monLeft,
  "direction" : "top-left",
  "width" : "screenSizeX/9",
  "height" : "screenSizeY"
});

var lapMain = lapChat.dup({ "direction" : "top-right", "width" : "8*screenSizeX/9" });

var mainLeft      = mainFull.dup({ "width" : "screenSizeX/2" });
var mainRight     = mainFull.dup({ "width" : "screenOriginX+(screenSizeX/2)" });

var leftLeft      = leftFull.dup({ "width" : "screenSizeX/2" });
var leftRight     = leftLeft.dup({ "x" : "screenOriginX+(screenSizeX/2)" });

var rightLeft     = rightFull.dup({ "width" : "screenSizeX/2" });
var rightRight    = rightLeft.dup({ "x" : "screenOriginX+(screenSizeX/2)" });

var leftLeftSmall = leftLeft.dup({ "width" : "screenSizeX/4" });
var leftRightTop  = leftRight.dup({ "x" : "screenOriginX+(screenSizeX*2/3)" })

// common layout hashes
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};
var adiumHash = {
  "operations" : [lapChat, lapMain],
  "ignore-fail" : true,
  "title-order" : ["Contacts"],
  "repeat-last" : true
};
var mvimHash = {
  "operations" : [leftRight, rightLeft],
  "repeat" : true
};
var genBrowserHash = function(regex) {
  return {
    "operations" : [function(windowObject) {
      var title = windowObject.title();
      if (title !== undefined && title.match(regex)) {
        windowObject.doOperation(leftLeft);
      } else {
        windowObject.doOperation(lapMain);
      }
    }],
    "ignore-fail" : true,
    "repeat" : true
  };
}

// 3 monitor layout
var threeMonitorLayout = S.lay("threeMonitor", {
  "Adium" : {
    "operations" : [lapChat, leftLeftSmall],
    "ignore-fail" : true,
    "title-order" : ["Contacts"],
    "repeat-last" : true
  },
  "MacVim" : mvimHash,
  "SourceTree" : {
    "operations" : [leftRightTop, leftLeft],
    "ignore-fail" : true,
    "title-order" : ["Bookmarks"],
    "repeat" : true
  },
  "Firefox" : genBrowserHash(/^Firebug\s-\s.+$/),
  "Safari" : lapMainHash,
  "Spotify" : {
    "operations" : [rightFull],
    "repeat" : true
  },
  "Sublime Text" : {
    "operations" : [mainLeft],
    "repeat" : true
  },
  "Eclipse" : {
    "operations" : [mainFull],
    "repeat" : true
  },
  "Google Chrome" : genBrowserHash(/^Developer\sTools\s-\s.+$/)
});

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "Adium" : adiumHash,
  "MacVim" : lapMainHash,
  "Google Chrome" : lapMainHash,
  "Xcode" : lapMainHash,
  "SourceTree" : lapMainHash,
  "Firefox" : lapMainHash,
  "Safari" : lapMainHash,
  "Eclipse" : lapMainHash,
  "Spotify" : lapMainHash
});

var twoMonitorLayout = oneMonitorLayout;

// Defaults
S.def(3, threeMonitorLayout);
S.def(2, twoMonitorLayout);
S.def(1, oneMonitorLayout);

// Layout Operations
var threeMonitor = S.op("layout", { "name" : threeMonitorLayout });
var twoMonitor = S.op("layout", { "name" : twoMonitorLayout });
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  // Should probably make sure the resolutions match but w/e
  S.log("SCREEN COUNT: "+S.screenCount());
  if (S.screenCount() === 3) {
    threeMonitor.run();
  } else if (S.screenCount() === 2) {
    twoMonitor.run();
  } else if (S.screenCount() === 1) {
    oneMonitor.run();
  }
};

// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings
  "padEnter:ctrl" : universalLayout,
  // "space:ctrl" : universalLayout,

  // Basic Location Bindings
  "pad0:ctrl" : lapChat,
  "[:ctrl"    : lapChat,
  "pad.:ctrl" : lapMain,
  "]:ctrl"    : lapMain,
  "pad7:ctrl" : leftLeft,
  "pad8:ctrl" : leftFull,
  "pad9:ctrl" : leftRight,
  "pad1:ctrl" : rightLeft,
  "pad2:ctrl" : rightFull,
  "pad3:ctrl" : rightRight,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl" : S.op("resize", { "width" : "+10%", "height" : "+0" }),
  "left:ctrl" : S.op("resize", { "width" : "-10%", "height" : "+0" }),
  "up:ctrl" : S.op("resize", { "width" : "+0", "height" : "-10%" }),
  "down:ctrl" : S.op("resize", { "width" : "+0", "height" : "+10%" }),
  "right:alt;cmd" : S.op("resize", { "width" : "-10%", "height" : "+0", "anchor" : "bottom-right" }),
  "left:alt;cmd" : S.op("resize", { "width" : "+10%", "height" : "+0", "anchor" : "bottom-right" }),
  "up:alt;cmd" : S.op("resize", { "width" : "+0", "height" : "+10%", "anchor" : "bottom-right" }),
  "down:alt;cmd" : S.op("resize", { "width" : "+0", "height" : "-10%", "anchor" : "bottom-right" }),

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl;cmd" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" }),
  "left:ctrl;cmd" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" }),
  "up:ctrl;cmd" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "down:ctrl;cmd" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl;alt" : S.op("nudge", { "x" : "+10%", "y" : "+0" }),
  "left:ctrl;alt" : S.op("nudge", { "x" : "-10%", "y" : "+0" }),
  "up:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-10%" }),
  "down:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+10%" }),

  // Throw Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "pad1:ctrl;alt" : S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "pad2:ctrl;alt" : S.op("throw", { "screen" : "1", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "pad3:ctrl;alt" : S.op("throw", { "screen" : "0", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "right:ctrl;alt;cmd" : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "left:ctrl;alt;cmd" : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "up:ctrl;alt;cmd" : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "down:ctrl;alt;cmd" : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),

  // Focus Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "l:cmd" : S.op("focus", { "direction" : "right" }),
  // "h:cmd" : S.op("focus", { "direction" : "left" }),
  // "k:cmd" : S.op("focus", { "direction" : "up" }),
  // "j:cmd" : S.op("focus", { "direction" : "down" }),
  // "k:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "j:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "right:cmd" : S.op("focus", { "direction" : "right" }),
  // "left:cmd" : S.op("focus", { "direction" : "left" }),
  // "up:cmd" : S.op("focus", { "direction" : "up" }),
  // "down:cmd" : S.op("focus", { "direction" : "down" }),
  // "up:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  // "down:cmd;alt" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  "esc:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "esc:ctrl" : S.op("grid")
});

// Test Cases
S.src(".slate.test", true);
S.src(".slate.test.js", true);

// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");
