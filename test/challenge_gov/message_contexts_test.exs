defmodule ChallengeGov.MessageContextsTest do
  use ChallengeGov.DataCase

  alias ChallengeGov.MessageContexts
  alias ChallengeGov.MessageContextStatuses

  alias ChallengeGov.TestHelpers.AccountHelpers
  alias ChallengeGov.TestHelpers.ChallengeHelpers
  alias ChallengeGov.TestHelpers.SubmissionHelpers

  describe "creating a message context" do
    test "success" do
      user = AccountHelpers.create_user()
      user_solver = AccountHelpers.create_user(%{email: "solver@example.com"})

      challenge = ChallengeHelpers.create_single_phase_challenge(user, %{user_id: user.id})
      _submission = SubmissionHelpers.create_submitted_submission(%{}, user_solver, challenge)

      _prepped_message_context = MessageContexts.new(["solvers"])

      {:ok, message_context} =
        MessageContexts.create(%{
          "context" => "challenge",
          "context_id" => challenge.id,
          "audience" => ["solvers"]
        })

      user_context_status = Enum.at(MessageContextStatuses.all_for_user(user), 0)
      user_solver_context_status = Enum.at(MessageContextStatuses.all_for_user(user_solver), 0)

      assert user_context_status.message_context_id == message_context.id
      assert user_solver_context_status.message_context_id == message_context.id
    end
  end

  describe "finding existing message context" do
    test "success: with existing context, context_id, and audience combination" do
      user = AccountHelpers.create_user()
      user_solver = AccountHelpers.create_user(%{email: "solver@example.com"})

      challenge = ChallengeHelpers.create_single_phase_challenge(user, %{user_id: user.id})
      _submission = SubmissionHelpers.create_submitted_submission(%{}, user_solver, challenge)

      _prepped_message_context = MessageContexts.new(["solvers"])

      {:ok, message_context} =
        MessageContexts.create(%{
          "context" => "challenge",
          "context_id" => challenge.id,
          "audience" => ["solvers"]
        })

      {:ok, message_context_2} =
        MessageContexts.create(%{
          "context" => "challenge",
          "context_id" => challenge.id,
          "audience" => ["solvers"]
        })

      assert message_context.id == message_context_2.id
    end
  end
end
