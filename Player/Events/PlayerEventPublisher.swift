//
//  PlayerEventPublisher.swift
//  Player
//
//  Created by Fredrik Sjöberg on 2017-04-07.
//  Copyright © 2017 emp. All rights reserved.
//

import Foundation

/// Event publishing defines a set of events that can be listened to.
public protocol PlayerEventPublisher {
    /// Typed error
    associatedtype PlayerEventError: Error
    
    // MARK: Lifecycle
    /// Published when associated media is created but not yet loaded. Playback is not yet ready to start.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackCreated(callback: @escaping (Self) -> Void) -> Self
    
    /// Published when the associated media has loaded but is not playback ready.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackPrepared(callback: @escaping (Self) -> Void) -> Self
    
    /// Published whenever an `error` occurs.
    ///
    /// - parameter callback: callback to fire once the event is fired. `PlayerEventError` specifies that error.
    /// - returns: `Self`
    func onError(callback: @escaping (Self, PlayerEventError) -> Void) -> Self
    
    // MARK: Configuration
    /// Published whenever the current *Bitrate* changes.
    ///
    /// - parameter callback: callback to fire once the event is fired. `BitrateChangedEvent` specifies the event.
    /// - returns: `Self`
    func onBitrateChanged(callback: @escaping (BitrateChangedEvent) -> Void) -> Self
    
    /// Published once buffering started.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onBufferingStarted(callback: @escaping (Player) -> Void) -> Self
    
    /// Published once buffering stopped.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onBufferingStopped(callback: @escaping (Player) -> Void) -> Self
    
    /// Published if the current playback `duration` changed.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onDurationChanged(callback: @escaping (Player) -> Void) -> Self
    
    // MARK: Playback
    /// Published when the associated media has loaded and is ready for playback. At this point, starting playback should be possible.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackReady(callback: @escaping (Player) -> Void) -> Self
    
    /// Published when playback reached the end of the current media, ie when playback reaches `duration`.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackCompleted(callback: @escaping (Player) -> Void) -> Self
    
    /// Published once the playback first starts. This should be a one-time-event.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackStarted(callback: @escaping (Player) -> Void) -> Self
    
    /// Published when playback is stopped by user action.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackAborted(callback: @escaping (Player) -> Void) -> Self
    
    /// Published when playback is paused for some reason.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackPaused(callback: @escaping (Player) -> Void) -> Self
    
    /// Published when playback is resumed from a paused state for some reason.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackResumed(callback: @escaping (Player) -> Void) -> Self

    /// Published when user scrubs in the player.
    ///
    /// - parameter callback: callback to fire once the event is fired.
    /// - returns: `Self`
    func onPlaybackScrubbed(callback: @escaping (Player, Int64) -> Void) -> Self
    
    
     /*func onScrubbedTo(callback: @escaping (Self) -> Void) -> Self
     func onSubtitlesEnabled(callback: @escaping (Self) -> Void) -> Self
     
     
     // MARK: Ads
     func onAdStarted(callback: @escaping (Self) -> Void)
     func onAdCompleted(callback: @escaping (Self) -> Void)
     
     
     // MARK: Program
     func onProgramChanged(callback: @escaping (Self) -> Void)
     */
    //func onDownloadStarted(callback: @escaping (Self) -> Void)
    //func onDownloadStopped(callback: @escaping (Self) -> Void)
    //func onDownloadCompleted(callback: @escaping (Self) -> Void)
}
