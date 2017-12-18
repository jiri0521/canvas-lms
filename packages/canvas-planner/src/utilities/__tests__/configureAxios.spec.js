/*
 * Copyright (C) 2017 - present Instructure, Inc.
 *
 * This file is part of Canvas.
 *
 * Canvas is free software: you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License as published by the Free
 * Software Foundation, version 3 of the License.
 *
 * Canvas is distributed in the hope that they will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import axios from 'axios';
import configureAxios from '../configureAxios';

it('sets the proper defaults on the axios object', () => {
  configureAxios(axios);
  expect(axios.defaults.xsrfCookieName).toBe('_csrf_token');
  expect(axios.defaults.xsrfHeaderName).toBe('X-CSRF-Token');
  expect(axios.defaults.headers.common['Accept']).toMatch('application/json+canvas-string-ids');
  expect(axios.defaults.headers.common['X-Requested-With']).toBe('XMLHttpRequest');
});
