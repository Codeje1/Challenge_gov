defmodule ChallengeGov.MessagesTest do
  # use ChallengeGov.DataCase

  # alias ChallengeGov.Repo

  # alias ChallengeGov.Messages
  # alias ChallengeGov.MessageContexts
  # alias ChallengeGov.MessageContextStatuses

  # alias ChallengeGov.TestHelpers.AccountHelpers
  # alias ChallengeGov.TestHelpers.ChallengeHelpers

  # describe "creating a message" do
  #   test "success" do
  #     user = AccountHelpers.create_user()
  #     user_2 = AccountHelpers.create_user(%{email: "user2@example.com"})
  #     challenge = ChallengeHelpers.create_single_phase_challenge(user, %{user_id: user.id})

  #     {:ok, message} =
  #       Messages.create(user, "challenge", challenge.id, %{
  #         content: "Test",
  #         content_delta: "Test"
  #       })

  #     assert message.content == "Test"

  #     {:ok, message_2} =
  #       Messages.create(user_2, "challenge", challenge.id, %{
  #         content: "Test 2",
  #         content_delta: "Test 2"
  #       })

  #     assert message_2.content == "Test 2"
  #     assert message.message_context_id == message_2.message_context_id

  #     {:ok, message_context} = MessageContexts.get("challenge", challenge.id)
  #     message_context = Repo.preload(message_context, [:messages])
  #     assert length(message_context.messages) == 2

  #     {:ok, _message_context_status} = MessageContextStatuses.get(user, message_context)
  #     {:ok, _message_context_status_2} = MessageContextStatuses.get(user_2, message_context)
  #   end
  # end
end