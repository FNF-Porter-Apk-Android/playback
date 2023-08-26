local allowCountdown = false
local incs = false
local cx = 0
local cy = 0
local squish= 80

function onCreate()

	    makeLuaSprite('black', '', 0, 0)
	    setScrollFactor('black', 0, 0)
	    makeGraphic('black', 3840, 2160, '000000')
	    addLuaSprite('black', false)
	    setProperty('black.alpha', 1)
	    screenCenter('black', 'xy')
		setObjectCamera('black','camOther')

		makeAnimatedLuaSprite('bfRun', 'loading/bf running', 40, 460);
		addAnimationByPrefix('bfRun', 'anim', 'bf running', 24, true);
		setLuaSpriteScrollFactor('bfRun',0,0)
		objectPlayAnimation('bfRun','anim',true)
		addLuaSprite('bfRun', false)
		setProperty('bfRun.antialiasing',true)
		scaleObject('bfRun', 0.3, 0.3)
		setObjectCamera('bfRun','camOther')
		runTimer('l',0.02,1)

	    precacheSound(assets[i])
	    precacheImage('characters');
	    precacheImage('images');
	    precacheSound('songs')
	    precacheSound('sounds')
	    precacheImage('characters');
	    precacheImage('hud');
	    precacheImage('assets');
	    precacheImage('shared');
		addCharacterToList('hexcrazy, dad')
		addCharacterToList('bfalt, boyfriend')
		addCharacterToList('hexalt, boyfriend')

	    precacheImage('images/stage/wire/messages wire');
	    precacheImage('images/stage/wire/court wire');
	    precacheImage('images/stage/wire/blue screen wire');
	    precacheImage('images/stage/wire/back layer 2 wire');
	    precacheImage('images/stage/wire/back first layer wire');
	    preCacheShit()

end

function onCreatePost()
		setProperty('camGame.alpha', 1)

end

function onStartCountdown()
	if not allowCountdown and not seenCutscene then
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
		runTimer('l', 3)
		return Function_Stop
	end
	return Function_Continue
end


local pause = false
local esc = false
local MR = false

function onSongStart()
	pause = true
	setProperty('boyfriend.stunned', false)
end

function preCacheShit()
    for i = 1,#assets do
        precacheImage(assets[i])
    end
	    precacheSound(assets[i])
	    precacheImage('characters');
	    precacheImage('images');
	    precacheSound('songs')
	    precacheSound('sounds')
	    precacheImage('characters');
	    precacheImage('hud');
	    precacheImage('assets');
	    precacheImage('shared');
		addCharacterToList('hexcrazy, dad')
		addCharacterToList('bfalt, boyfriend')
		addCharacterToList('hexalt, boyfriend')

	    precacheImage('images/stage/wire/messages wire');
	    precacheImage('images/stage/wire/court wire');
	    precacheImage('images/stage/wire/blue screen wire');
	    precacheImage('images/stage/wire/back layer 2 wire');
	    precacheImage('images/stage/wire/back first layer wire');
	    preCacheShit()
end

function onUpdate( elapsed )

	if not allowCountdown and (keyReleased('space') or getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ENTER')) and not startedCountdown then

	--if not allowCountdown and not startedCountdown then
		allowCountdown = true
		startCountdown()
		--playSound('clickText')
		removeLuaSprite('bfRun', true)
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
		runTimer('ll', 0.1)
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ESCAPE') and not esc and pause then
		esc = true
		pause = false
		endSong()
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.ESCAPE') and esc then
		pause = false
		endSong()
	end
end

function onTimerCompleted(t,l,ll)

	if t=='l' then

		allowCountdown = true
		startCountdown()
		--playSound('clickText')
		removeLuaSprite('bfRun', true)
		setPropertyFromClass('flixel.FlxG', 'mouse.visible', false);
		setPropertyFromClass('PlayState','seenCutscene',true)
    	doTweenAlpha('black', 'black', 0, 0.5, 'linear');
	end

	if t=='ll' then
		setPropertyFromClass('PlayState','seenCutscene',true)
    	doTweenAlpha('black', 'black', 0, 0.5, 'linear');

	end
end