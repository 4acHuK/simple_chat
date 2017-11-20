module ApplicationHelper
  def friendship_actions(current_user, user)
    if current_user.friends_with?(user)
      link_to "remove friendship", friendship_action_user_path(id: current_user.id, friend_id: user.id,
                                                               action_type: 'remove_friend')
    elsif current_user.pending_friends.include?(user)
      "You have already sent request"
    elsif current_user.requested_friends.include?(user)
      link_to "accept friendship", friendship_action_user_path(id: current_user.id, friend_id: user.id,
                                                               action_type: 'accept_request')
    else
      link_to "send friendship request", friendship_action_user_path(id: current_user.id, friend_id: user.id,
                                                                     action_type: 'friend_request')
    end
  end
end
