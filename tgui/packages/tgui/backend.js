/**
 * This file provides a clear separation layer between backend updates
 * and what state our React app sees.
 *
 * Sometimes backend can response without a "data" field, but our final
 * state will still contain previous "data" because we are merging
 * the response with already existing state.
<<<<<<< HEAD
 *
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

import { perf } from 'common/perf';
import { UI_DISABLED, UI_INTERACTIVE } from './constants';
import { releaseHeldKeys } from './hotkeys';
import { createLogger } from './logging';

const logger = createLogger('backend');
=======
 */

import { UI_DISABLED, UI_INTERACTIVE } from './constants';
import { callByond } from './byond';
>>>>>>> master

export const backendUpdate = state => ({
  type: 'backend/update',
  payload: state,
});

export const backendSetSharedState = (key, nextState) => ({
  type: 'backend/setSharedState',
  payload: { key, nextState },
});

<<<<<<< HEAD
export const backendSuspendStart = () => ({
  type: 'backend/suspendStart',
});

export const backendSuspendSuccess = () => ({
  type: 'backend/suspendSuccess',
  payload: {
    timestamp: Date.now(),
  },
});

const initialState = {
  config: {},
  data: {},
};

export const backendReducer = (state = initialState, action) => {
=======
export const backendReducer = (state, action) => {
>>>>>>> master
  const { type, payload } = action;

  if (type === 'backend/update') {
    // Merge config
    const config = {
      ...state.config,
      ...payload.config,
    };
    // Merge data
    const data = {
      ...state.data,
      ...payload.static_data,
      ...payload.data,
    };
    // Merge shared states
    const shared = { ...state.shared };
    if (payload.shared) {
      for (let key of Object.keys(payload.shared)) {
        const value = payload.shared[key];
        if (value === '') {
          shared[key] = undefined;
        }
        else {
          shared[key] = JSON.parse(value);
        }
      }
    }
    // Calculate our own fields
    const visible = config.status !== UI_DISABLED;
    const interactive = config.status === UI_INTERACTIVE;
    // Return new state
    return {
      ...state,
      config,
      data,
      shared,
      visible,
      interactive,
<<<<<<< HEAD
      suspended: false,
=======
>>>>>>> master
    };
  }

  if (type === 'backend/setSharedState') {
    const { key, nextState } = payload;
    return {
      ...state,
      shared: {
        ...state.shared,
        [key]: nextState,
      },
    };
  }

<<<<<<< HEAD
  if (type === 'backend/suspendStart') {
    return {
      ...state,
      suspending: true,
    };
  }

  if (type === 'backend/suspendSuccess') {
    const { timestamp } = payload;
    return {
      ...state,
      data: {},
      shared: {},
      config: {
        ...state.config,
        title: '',
        status: 1,
      },
      suspending: false,
      suspended: timestamp,
    };
  }

  return state;
};

export const backendMiddleware = store => {
  let fancyState;
  let suspendInterval;

  return next => action => {
    const { config, suspended } = selectBackend(store.getState());
    const { type, payload } = action;

    if (type === 'backend/suspendStart' && !suspendInterval) {
      logger.log(`suspending (${window.__windowId__})`);
      // Keep sending suspend messages until it succeeds.
      // It may fail multiple times due to topic rate limiting.
      const suspendFn = () => sendMessage({
        type: 'suspend',
      });
      suspendFn();
      suspendInterval = setInterval(suspendFn, 2000);
    }

    if (type === 'backend/suspendSuccess') {
      clearInterval(suspendInterval);
      suspendInterval = undefined;
      releaseHeldKeys();
      Byond.winset(window.__windowId__, {
        'is-visible': false,
      });
    }

    if (type === 'backend/update') {
      const fancy = payload.config?.window?.fancy;
      // Initialize fancy state
      if (fancyState === undefined) {
        fancyState = fancy;
      }
      // React to changes in fancy
      else if (fancyState !== fancy) {
        logger.log('changing fancy mode to', fancy);
        fancyState = fancy;
        Byond.winset(window.__windowId__, {
          titlebar: !fancy,
          'can-resize': !fancy,
        });
      }
    }

    if (type === 'backend/update' && suspended) {
      // We schedule this for the next tick here because resizing and unhiding
      // during the same tick will flash with a white background.
      setImmediate(() => {
        perf.mark('resume/start');
        // Doublecheck if we are not re-suspended.
        const { suspended } = selectBackend(store.getState());
        if (suspended) {
          return;
        }
        Byond.winset(window.__windowId__, {
          'is-visible': true,
        });
        perf.mark('resume/finish');
        if (process.env.NODE_ENV !== 'production') {
          logger.log('visible in',
            perf.measure('render/finish', 'resume/finish'));
        }
      });
    }

    return next(action);
  };
};

/**
 * Sends a message to /datum/tgui_window.
 */
export const sendMessage = (message = {}) => {
  const { payload, ...rest } = message;
  const data = {
    // Message identifying header
    tgui: 1,
    window_id: window.__windowId__,
    // Message body
    ...rest,
  };
  // JSON-encode the payload
  if (payload !== null && payload !== undefined) {
    data.payload = JSON.stringify(payload);
  }
  Byond.topic(data);
};

/**
 * Sends an action to `ui_act` on `src_object` that this tgui window
 * is associated with.
 */
export const sendAct = (action, payload = {}) => {
  // Validate that payload is an object
  const isObject = typeof payload === 'object'
    && payload !== null
    && !Array.isArray(payload);
  if (!isObject) {
    logger.error(`Payload for act() must be an object, got this:`, payload);
    return;
  }
  sendMessage({
    type: 'act/' + action,
    payload,
  });
};

=======
  return state;
};

>>>>>>> master
/**
 * @typedef BackendState
 * @type {{
 *   config: {
 *     title: string,
 *     status: number,
<<<<<<< HEAD
 *     interface: string,
 *     user: {
 *       name: string,
 *       ckey: string,
 *       observer: number,
 *     },
 *     window: {
 *       key: string,
 *       size: [number, number],
 *       fancy: boolean,
 *       locked: boolean,
 *     },
 *   },
 *   data: any,
 *   shared: any,
 *   visible: boolean,
 *   interactive: boolean,
 *   suspending: boolean,
 *   suspended: boolean,
=======
 *     screen: string,
 *     style: string,
 *     interface: string,
 *     fancy: number,
 *     locked: number,
 *     observer: number,
 *     window: string,
 *     ref: string,
 *   },
 *   data: any,
 *   visible: boolean,
 *   interactive: boolean,
>>>>>>> master
 * }}
 */

/**
<<<<<<< HEAD
 * Selects a backend-related slice of Redux state
 *
 * @return {BackendState}
 */
export const selectBackend = state => state.backend || {};

/**
=======
>>>>>>> master
 * A React hook (sort of) for getting tgui state and related functions.
 *
 * This is supposed to be replaced with a real React Hook, which can only
 * be used in functional components.
 *
 * @return {BackendState & {
<<<<<<< HEAD
 *   act: sendAct,
=======
 *   act: (action: string, params?: object) => void,
>>>>>>> master
 * }}
 */
export const useBackend = context => {
  const { store } = context;
<<<<<<< HEAD
  const state = selectBackend(store.getState());
  return {
    ...state,
    act: sendAct,
  };
=======
  const state = store.getState();
  const ref = state.config.ref;
  const act = (action, params = {}) => {
    callByond('', {
      src: ref,
      action,
      ...params,
    });
  };
  return { ...state, act };
>>>>>>> master
};

/**
 * Allocates state on Redux store without sharing it with other clients.
 *
 * Use it when you want to have a stateful variable in your component
 * that persists between renders, but will be forgotten after you close
 * the UI.
 *
 * It is a lot more performant than `setSharedState`.
 *
 * @param {any} context React context.
 * @param {string} key Key which uniquely identifies this state in Redux store.
 * @param {any} initialState Initializes your global variable with this value.
 */
export const useLocalState = (context, key, initialState) => {
  const { store } = context;
<<<<<<< HEAD
  const state = selectBackend(store.getState());
=======
  const state = store.getState();
>>>>>>> master
  const sharedStates = state.shared ?? {};
  const sharedState = (key in sharedStates)
    ? sharedStates[key]
    : initialState;
  return [
    sharedState,
    nextState => {
<<<<<<< HEAD
      store.dispatch(backendSetSharedState(key, (
        typeof nextState === 'function'
          ? nextState(sharedState)
          : nextState
      )));
=======
      store.dispatch(backendSetSharedState(key, nextState));
>>>>>>> master
    },
  ];
};

/**
 * Allocates state on Redux store, and **shares** it with other clients
 * in the game.
 *
 * Use it when you want to have a stateful variable in your component
 * that persists not only between renders, but also gets pushed to other
 * clients that observe this UI.
 *
 * This makes creation of observable s
 *
 * @param {any} context React context.
 * @param {string} key Key which uniquely identifies this state in Redux store.
 * @param {any} initialState Initializes your global variable with this value.
 */
export const useSharedState = (context, key, initialState) => {
  const { store } = context;
<<<<<<< HEAD
  const state = selectBackend(store.getState());
=======
  const state = store.getState();
  const ref = state.config.ref;
>>>>>>> master
  const sharedStates = state.shared ?? {};
  const sharedState = (key in sharedStates)
    ? sharedStates[key]
    : initialState;
  return [
    sharedState,
    nextState => {
<<<<<<< HEAD
      sendMessage({
        type: 'setSharedState',
        key,
        value: JSON.stringify(
          typeof nextState === 'function'
            ? nextState(sharedState)
            : nextState
        ) || '',
=======
      callByond('', {
        src: ref,
        action: 'tgui:setSharedState',
        key,
        value: JSON.stringify(nextState) || '',
>>>>>>> master
      });
    },
  ];
};
