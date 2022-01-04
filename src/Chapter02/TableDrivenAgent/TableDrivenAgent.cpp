// Copyright ei06125. All Rights Reserved.
#include "aimaPCH.hpp"

/// ===========================================================================
/// @file AgentProgram.hpp
/// ===========================================================================
template <class P, class A> using Action = std::function<std::optional<A>(P)>;

template <class P, class A> class AgentProgram : Action<P, A> {
  public:
	virtual ~AgentProgram() = default;
	virtual std::optional<A> apply(P percept) = 0;
};

/// ===========================================================================
/// @file TableDrivenAgentProgram.hpp
/// ===========================================================================
template <class A, class P> class TableDrivenAgent : public AgentProgram<P, A> {
  public:
	virtual std::optional<A> apply(P percept) override {}

  private:
	std::vector<P> mPercepts{};
	static std::unordered_map<std::vector<P>, A> mActionsTable{};
};


TEST_CASE("TableDrivenAgentProgram") {
	CHECK(false);
}
