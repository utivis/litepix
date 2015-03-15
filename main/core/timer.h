/*
 * timer.h
 * This file is part of litepix
 *
 * Copyright (C) 2015 - Florian Rommel
 *
 * litepix is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * litepix is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with litepix. If not, see <http://www.gnu.org/licenses/>.
 */


#ifndef _CORE__TIMER_H_
#define _CORE__TIMER_H_

#include <stdint.h>
#include <stdbool.h>
#include "clock.h"


#define TIMER_INIT(interval) (t_timer) \
    { ._next = clock_time_ms() + interval, \
      ._state = (interval >= 0) };


typedef struct {
    uint16_t _next;
    bool _state;
} t_timer;


bool timer_test(t_timer* timer, int16_t new_interval);


#endif
