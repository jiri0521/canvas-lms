# frozen_string_literal: true

#
# Copyright (C) 2019 - present Instructure, Inc.
#
# This file is part of Canvas.
#
# Canvas is free software: you can redistribute it and/or modify it under
# the terms of the GNU Affero General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# Canvas is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero General Public License for more
# details.
#
# You should have received a copy of the GNU Affero General Public License along
# with this program. If not, see <http://www.gnu.org/licenses/>.
#

module Messages::AssignmentSubmitted
  class SMSPresenter < Presenter
    def subject
      if anonymous?
        I18n.t(
          "A student just turned in their anonymous assignment, %{assignment_title}",
          assignment_title: assignment.title
        )
      else
        I18n.t(
          "%{user_name} just turned in their assignment, %{assignment_title}",
          assignment_title: assignment.title,
          user_name: submission.user.name
        )
      end
    end

    def body
      I18n.t(
        "More info at %{web_address}",
        web_address: HostUrl.context_host(assignment.context)
      )
    end
  end
end
